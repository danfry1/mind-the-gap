import { describe, it, expect } from "bun:test";
import {
  relativeLuminance,
  contrastRatio,
  validatePalette,
} from "../scripts/validate-contrast";
import type { Palette } from "../scripts/validate-contrast";
import palette from "../palette.json";

describe("relativeLuminance", () => {
  it("returns 0 for black", () => {
    expect(relativeLuminance("#000000")).toBe(0);
  });

  it("returns 1 for white", () => {
    expect(relativeLuminance("#ffffff")).toBe(1);
  });

  it("returns intermediate value for grey", () => {
    const l = relativeLuminance("#808080");
    expect(l).toBeGreaterThan(0.2);
    expect(l).toBeLessThan(0.3);
  });

  it("throws on invalid hex", () => {
    expect(() => relativeLuminance("not-a-color")).toThrow();
    expect(() => relativeLuminance("#fff")).toThrow();
  });
});

describe("contrastRatio", () => {
  it("black on white is 21:1", () => {
    expect(contrastRatio("#000000", "#ffffff")).toBe(21);
  });

  it("same color is 1:1", () => {
    expect(contrastRatio("#808080", "#808080")).toBe(1);
  });

  it("is symmetric", () => {
    const a = contrastRatio("#d8dce8", "#0c1628");
    const b = contrastRatio("#0c1628", "#d8dce8");
    expect(a).toBe(b);
  });

  it("returns a reasonable ratio for theme colors", () => {
    // text on base should have good contrast
    const ratio = contrastRatio("#d8dce8", "#0c1628");
    expect(ratio).toBeGreaterThan(4.5);
  });
});

describe("validatePalette", () => {
  const p = palette as unknown as Palette;

  it("passes for the Mind the Gap palette", () => {
    const result = validatePalette(p);
    if (!result.pass) {
      console.error("Failures:", result.failures);
    }
    expect(result.pass).toBe(true);
  });

  it("fails when text has no contrast", () => {
    const bad: Palette = {
      ...p,
      foregrounds: { ...p.foregrounds, text: p.backgrounds.base },
    };
    const result = validatePalette(bad);
    expect(result.pass).toBe(false);
  });

  it("fails with dim accent on base", () => {
    const bad: Palette = {
      ...p,
      accents: { ...p.accents, elizabeth: "#111111" },
    };
    const result = validatePalette(bad);
    expect(result.pass).toBe(false);
  });

  it("throws on missing backgrounds", () => {
    const bad = { ...p, backgrounds: undefined } as unknown as Palette;
    expect(() => validatePalette(bad)).toThrow();
  });

  it("throws on missing foregrounds", () => {
    const bad = { ...p, foregrounds: undefined } as unknown as Palette;
    expect(() => validatePalette(bad)).toThrow();
  });

  it("throws on missing base", () => {
    const bad: Palette = {
      ...p,
      backgrounds: { ...p.backgrounds, base: "" },
    };
    expect(() => validatePalette(bad)).toThrow();
  });

  it("validates all accents against base", () => {
    // Each accent should pass 4.5:1 against base
    // "central" only used for errors/deletions, so 3:1 is sufficient
    for (const [name, hex] of Object.entries(p.accents)) {
      const minRatio = name === "central" ? 3 : 4.5;
      const ratio = contrastRatio(hex, p.backgrounds.base);
      expect(ratio).toBeGreaterThanOrEqual(minRatio);
    }
  });
});
