# 形式化驗證在 AI 工程的應用 (Formal & Runtime Verification)

- **領域分類**：System Verification / Trustworthy AI
- **核心理念**：藉助數學證明與運行時不變量，檢驗 AI Agent 是否真正遵守系統設計意圖。
- **代表工具**：TLA+、Lean、Runtime Invariants Assertions。

---

## 1. 概念定義與直覺 (Definition & Intuition)
即便代碼通過了靜態型別檢查與基礎單元測試，仍可能存在複雜的並發競態（Race Conditions）或分散式系統狀態機漏洞。

**形式化驗證（Formal Verification）** 使用嚴密的數學邏輯語言對軟體規格與不變量（Invariants）進行全空間狀態窮舉驗證：
- **TLA+**：用以建模與驗證高並發、分散式系統的狀態機轉換邏輯。
- **Lean**：互動式定理證明器，用以證明演算法屬性在任何輸入下均成立。

在 Agent 規模化開發環境中，形式化驗證是構築頂層信任的終極盾牌，確保 Agent 交付的複雜邏輯在數學上無懈可擊。

---

## 2. 本知識庫相關影片 (Related Videos)
- [All Code Is Slop (Except Mine) — Lauren Tan](wiki/videos/All_Code_Is_Slop_Except_Mine_Lauren_Tan.md)
