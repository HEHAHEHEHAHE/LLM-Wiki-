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

## [2026-11-23] lint & fix | 對齊 Poteto 倒金字塔 5 層真實架構
- **觸發檢查**：人工比對演講原版投影片（Ground Truth 截圖）。
- **發現衝突與缺陷**：
  1. 原版倒金字塔共有 **5 層**，原先筆記與簡報遺漏了最底部的第 5 層 `human review`。
  2. 原版為真正的倒三角形（$\nabla$），先前的 ASCII 與敘述存在正反方向與層級混淆。
- **修復執行**：
  - 更新 `wiki/videos/All_Code_Is_Slop_Except_Mine_Lauren_Tan.md` 為精確的 5 層倒金字塔模型（Codebase $\to$ Static Analysis $\to$ Verification $\to$ Prose $\to$ Human Review）。
  - 重構 `slides.html` 第 4 頁投影片，採用等比例縮進寬度（95% $\to$ 82% $\to$ 68% $\to$ 54% $\to$ 38%），在 HTML 簡報中直觀呈現完美的倒三角形視覺層級。

## [2026-11-23] extract-keyframes | 執行 YouTube 串流影格抽取 (Keyframe Extraction)
- 使用 `yt-dlp` 與 `ffmpeg` 針對 `https://youtu.be/O_zcc6Xl12g` 串流直接進行毫秒級無損抽幀。
- 成功截取 7 張關鍵演講 PPT 投影片並存入 `wiki/assets/All_Code_Is_Slop_Except_Mine_Lauren_Tan/`：
  - `02_poteto_pyramid.png` (原創倒金字塔 5 層架構)
  - `03_garden_analogy.png` (Code is memory 理念)
  - `04_use_effect_ban.png` (Dune 框架禁用規範)
  - `06_ban_comments.png` (183 個定時器踩坑時間軸)
  - `07_summary_golden_rule.png` (黃金反饋法則)
- 已將原版 PPT 截圖完整嵌入至 `wiki/videos/All_Code_Is_Slop_Except_Mine_Lauren_Tan.md` 筆記中。

## [2026-11-23] upgrade | 落實圖表四步深度解析與實戰投影片優化
- 依照 hBN 專案之最高標準，為 `All_Code_Is_Slop_Except_Mine_Lauren_Tan.md` 建立 4 大關鍵投影片之完整深度解析章節（視覺組件、數據流向、設計意圖、量化結論）：
  1. Figure 1: The Poteto Pyramid（倒金字塔 5 層模型）
  2. Figure 2: Code is Memory（代碼即記憶與花園本質）
  3. Figure 3: Dune Framework（三大架構約束支柱）
  4. Figure 4: Quick Fixes Considered Harmful（183 Timers 指數級擴散踩坑）
- 在 Reveal.js 簡報第 6 頁嵌入真實的「183 Timers Incident」歷史時間軸投影片截圖，大幅強化簡報說服力與學術厚度。

## [2026-11-24] fix | 修復側欄簡報白屏與新增背景靜默伺服器
- **修復簡報跳轉白屏**：Docsify 側邊欄將 `[slides.html]` 誤當作單頁內嵌 Markdown 路由，導致右側渲染空白。改為 `<a href="slides.html" target="_blank">` 原生外鏈，點擊自動於全新分頁開啟全螢幕 Reveal.js 簡報。
- **解決工作列黑視窗問題**：新增 `啟動預覽(無黑視窗).vbs`（點擊後自動隱藏視窗於背景靜默執行，不佔用工作列），並配套提供 `停止預覽伺服器.bat` 供隨時一鍵終止背景進程。

## [2026-11-24] refactor | 全面恢復為與 hBN 完全一致的純淨標準架構
- **根本問題排除**：
  1. 移除不穩定之 VBS 腳本與 raw HTML 語法，全面回歸與 hBN 專案完全一致的標準 Docsify 體系。
  2. 根目錄補足 `README.md`，徹底解決首頁 `404 - Not found` 錯誤。
  3. 側邊欄改回純淨 Markdown 鏈結：新增 `wiki/presentation.md` 專頁，內嵌 Reveal.js 播放器並提供全螢幕切換按鈕，徹底根除點擊簡報側欄白屏問題。

## [2026-11-24] style & fix | 移除所有 Emoji 圖標並修復全螢幕獨立播放按鈕
- **移除全部 Emoji 圖標**：全面清除側邊欄、標題與內文中的表情符號（如 🖥️、📺、👉 等），回歸純淨、嚴謹的極簡學術風格。
- **修復全螢幕按鈕失效**：改用原生 HTML 鏈結標籤 `<a href="slides.html" target="_blank">` 並美化為專業按鈕，點擊保證 100% 於新分頁全螢幕開啟 Reveal.js 簡報，徹底解決 Docsify 內部路由攔截導致點擊無反應之問題。

## [2026-11-24] upgrade | 對齊 hBN 啟動器、破除瀏覽器快取與落實演講規範至 AGENTS.md
- **啟動器完全對齊 hBN**：`啟動預覽.bat` 重構為與 hBN 完全一致之設定，點擊一次命令提示字元黑視窗自動退出自閉，背景靜默守護伺服器。
- **徹底杜絕簡報快取 (Cache-busting)**：在 `wiki/presentation.md` 的簡報內嵌與外連加上版本後綴 `?v=clean_20261124`，確保瀏覽器 100% 強制重載無 Emoji、無截圖的純淨卡片版面。
- **落實演講建議至規範法典**：在 `AGENTS.md` 正式確立「Poteto 倒金字塔模型（5 層）」、「黃金反饋法則（The Golden Rule）」與「消除花園雜草原則」，將演講精華轉化為專案的確定性防護手冊。


## [2026-11-24] ingest | What's Next for AI Agentic Workflows — Andrew Ng
- 原始英文字幕存入 `raw/Whats_Next_For_AI_Agentic_Workflows_Andrew_Ng.txt`（URL: https://youtu.be/sal78ACtGTc，共 351 行）。
- **影音雙軌抽幀 (Keyframe Extraction)**：使用 `ffmpeg` 針對 1080p 串流精確截取 8 張關鍵 PPT 圖表存入 `wiki/assets/Whats_Next_For_AI_Agentic_Workflows_Andrew_Ng/`。
- **撰寫結構化深度精讀筆記**：`wiki/videos/Whats_Next_For_AI_Agentic_Workflows_Andrew_Ng.md`：
  - 核心突破：揭露 GPT-3.5 + Agentic 工作流在 HumanEval 評測突破 80%，直接超越 Zero-shot GPT-4（67.0%）。
  - 圖表四步深度解析：完整拆解 Non-agentic vs. Agentic、HumanEval 長條圖、四大設計模式矩陣、Reflection/Tools/Planning/Multi-agent 機制圖。
  - 前瞻趨勢分析：解析 Fast Token Generation 為何是 Agentic Workflows 的關鍵推論基礎設施。
- **建立全新核心概念頁面**：
  - `wiki/concepts/agentic-design-patterns.md`（AI Agentic 四大設計模式）
  - `wiki/concepts/fast-token-generation.md`（高速 Token 生成對代理架構的關鍵影響）
- **同步更新全局導覽與教學簡報**：
  - 更新總目錄 `wiki/index.md` 與多目錄側邊欄 `_sidebar.md`。
  - 擴充 Reveal.js 教學簡報 `slides.html` 至 15 頁，無縫串聯 Lauren Tan（確定性外部邊界約束）與 Andrew Ng（代理內部推論工作流）的雙翼體系，完全保持無 Emoji 圖標、無截圖之極簡現代卡片版面。
