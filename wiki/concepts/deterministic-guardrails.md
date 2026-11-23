# 確定性防護欄與編譯約束 (Deterministic Guardrails)

- **領域分類**：Software Engineering / AI Agent Architecture
- **核心理念**：以機械化、不可妥協的確定性規則取代模糊脆弱的自然語言提示詞。
- **對應層級**：倒金字塔模型底層核心（Layer 1 & Layer 2）。

---

## 1. 概念定義與直覺 (Definition & Intuition)
在傳統 LLM 開發中，開發者常依賴在 System Prompt 或 `AGENTS.md` 中寫入長篇條文（如「千萬不要使用某某 API」、「請記得處理例外」）。然而，大語言模型本質上具備隨機性與概率漂移特性，純文字約束屬於「軟性防護（Soft Constraints）」，極易被模型忽視。

**確定性防護欄（Deterministic Guardrails）** 提倡將規範下沉至工程工具鏈本身：
- **編譯器與靜態分析（Compilers & Linters）**：若違反規則直接拋出致命錯誤（Fatal Error），拒絕編譯通過。
- **型別系統（Type Systems）**：透過嚴格的代數資料型別（ADT）與泛型約束，在型別層面杜絕非法狀態。
- **架構邊界檢查（Architecture Boundary）**：禁止模組間的非法 cross-import。

---

## 2. 為什麼確定性防護是 AI 規模化的基石？
1. **100% 可重現性 (Reproducibility)**：
   Prompt 可能因為對話歷史變長或模型微調而失效，但 Lint 規則與編譯器在每一次 CI/CD 流程中都具備絕對的一致性。
2. **減輕 Context Window 負擔**：
   每增加一條 Prompt 規則就會消耗貴重寶貴的 Context Window；若將規則轉化為 Linter，上下文得以保持乾淨精簡。
3. **消除 Code Review 瓶頸**：
   人類工程師不應浪費精力檢查格式、命名或基礎反模式，這類檢查應全數自動化。

---

## 3. 本知識庫相關影片 (Related Videos)
- [All Code Is Slop (Except Mine) — Lauren Tan](wiki/videos/All_Code_Is_Slop_Except_Mine_Lauren_Tan.md)
