import { describe, it, expect } from "bun:test";
import { flattenPalette, renderTemplate, generatePaletteLua } from "../scripts/generate";
import type { Palette } from "../scripts/validate-contrast";
import palette from "../palette.json";

describe("flattenPalette", () => {
  it("flattens nested palette into dot-notation keys", () => {
    const flat = flattenPalette(palette as unknown as Record<string, unknown>);
    expect(flat["backgrounds.base"]).toBe("#0c1628");
    expect(flat["accents.elizabeth"]).toBe("#9B70D8");
    expect(flat["name"]).toBe("Mind the Gap");
  });

  it("handles empty objects", () => {
    expect(flattenPalette({})).toEqual({});
  });
});

describe("renderTemplate", () => {
  const p = palette as unknown as Palette;

  it("renders nested palette references", () => {
    const result = renderTemplate("bg={{backgrounds.base}}", p);
    expect(result).toBe("bg=#0c1628");
  });

  it("renders _hex helper (no # prefix)", () => {
    const result = renderTemplate("bg={{backgrounds_base_hex}}", p);
    expect(result).toBe("bg=0c1628");
  });

  it("renders _r/_g/_b float helpers", () => {
    const result = renderTemplate("{{backgrounds_base_r}}", p);
    const val = parseFloat(result);
    expect(val).toBeGreaterThan(0);
    expect(val).toBeLessThan(1);
  });

  it("renders _rgb helper", () => {
    const result = renderTemplate("{{backgrounds_base_rgb}}", p);
    expect(result).toMatch(/^\d+,\d+,\d+$/);
  });

  it("throws on empty output", () => {
    expect(() => renderTemplate("{{nonexistent}}", p)).toThrow();
  });
});

describe("generatePaletteLua", () => {
  const p = palette as unknown as Palette;

  it("produces valid Lua with all sections", () => {
    const lua = generatePaletteLua(p);
    expect(lua).toContain('base = "#0c1628"');
    expect(lua).toContain('elizabeth = "#9B70D8"');
    expect(lua).toContain("M.backgrounds");
    expect(lua).toContain("M.foregrounds");
    expect(lua).toContain("M.accents");
    expect(lua).toContain("M.ansi");
    expect(lua).toContain("M.special");
    expect(lua).toContain("return M");
  });

  it("starts with auto-generated comment", () => {
    const lua = generatePaletteLua(p);
    expect(lua.startsWith("-- Auto-generated")).toBe(true);
  });
});
