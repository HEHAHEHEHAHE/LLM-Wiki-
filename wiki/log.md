# 時間活動日誌 (Chronological Activity Log)

本檔案遵循 Karpathy LLM Wiki 規範，以追加方式（Append-Only）依時序記錄本知識庫的所有 Ingest、Lint 與生成操作。

---

## [2026-11-23] initialize | 建立 AI 影音知識庫獨立架構
- 確立專案使命：專注於 AI Agents、代碼生成與前沿軟體架構之影音知識庫（Video-to-Wiki）。
- 建立三層目錄：`raw/`（不可變原始層）、`wiki/`（知識層）與 `AGENTS.md`（規範法典）。
- 完成前置討論與 8 大維度規格化對齊，確立「大圈很少轉，小圈轉得快」之 Graph 工作流。

## [2026-11-23] ingest | All Code Is Slop (Except Mine) — Lauren Tan
- 原始英文字幕存入 `raw/All_Code_Is_Slop_Except_Mine_Lauren_Tan.txt`（URL: https://youtu.be/O_zcc6Xl12g）。
- **Checkpoint 1 (Ingest Lint)**：執行 ASR 語音辨識錯誤修復，成功校正：
  - `ploy crust` $\to$ `Pull Request (PR)`
  - `slap` $\to$ `slop`
  - `agents.mmd` $\to$ `AGENTS.md`
  - `Grabbot at SpaceXsi` $\to$ `Grokbot at xAI`
- 撰寫結構化深度精讀筆記 `wiki/videos/All_Code_Is_Slop_Except_Mine_Lauren_Tan.md`：
  - 提煉核心論點：現代軟體工程師的核心使命是在生產力暴增下維持代碼庫品質。
  - 拆解「倒金字塔防護模型」：Codebase 架構 $\to$ 確定性檢查（Linters/Types） $\to$ 驗證體系 $\to$ 自然語言提示詞。
  - 詳析 4 大生產環境踩坑案例（React `useEffect`、Electron 執行緒隔離、命令式定時器、禁用 99% 逃生門註解）。
  - 記錄量化成果：單月 11,000 PRs、Revert 率約 0.5%。
- 建立並鏈結 3 個核心概念頁面：
  - `wiki/concepts/deterministic-guardrails.md`
  - `wiki/concepts/ai-agents-code-generation.md`
  - `wiki/concepts/formal-verification-llm.md`
- 同步更新總目錄 `wiki/index.md` 與導覽側邊欄。
