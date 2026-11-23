# AI Agents 規模化代碼生成體系 (Scaling AI Coding Agents)

- **領域分類**：Software Factory / Autonomous Agents
- **核心理念**：從單兵 AI 輔助（Copilot）跨越至成千上萬 Agents 並行的自主軟體工廠體系。
- **關鍵挑戰**：代碼吞吐量暴增導致的品質退化與反模式自我複製。

---

## 1. 概念定義與直覺 (Definition & Intuition)
過去的 AI 輔助編程以「行內補全（Code Completion）」為主，工程師仍是主要敲代碼的作者。隨著自主編程代理（Coding Agents，如 Cursor Agent、Grok Bot 等）的普及，單一工程師能夠同時派發數百個任務，Agent 獨立完成從閱讀代碼、生成 Patch、跑測試到提交 Pull Request (PR) 的全流程。

這使得軟體開發進入了**「代碼工廠（Software Factory）」**階段，生產力不再受限於打字速度，而是受限於**「審查與信任（Trust & Verification）」**。

---

## 2. 核心架構挑戰：雜草效應 (The Weed Effect)
在多 Agent 並行環境中，代碼庫本身的品質決定了 Agent 的表現：
1. **模式複製本能**：LLM 傾向於參考現有代碼結構。若代碼庫中存在臨時 Workaround 或不良註解，Agent 會視為標準模式廣泛套用。
2. **反模式指數級擴散**：少數不良代碼在數千個 Agent 的複製下，會在數天內污染整個專案。
3. **解決之道**：實施「零容忍治理」，廢除具高心智負擔的語法，維持代碼庫極度純淨。

---

## 3. 本知識庫相關影片 (Related Videos)
- [All Code Is Slop (Except Mine) — Lauren Tan](wiki/videos/All_Code_Is_Slop_Except_Mine_Lauren_Tan.md)
