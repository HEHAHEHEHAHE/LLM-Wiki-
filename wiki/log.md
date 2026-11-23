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


## [2026-11-24] refactor | 將教學簡報徹底拆解為「一影片一獨立簡報」架構
- **依據使用者回饋重構簡報架構**：解除先前的簡報接續模式，將每部演講的簡報全面獨立為專屬模組。
- **產出專屬獨立簡報檔案**：
  - `slides_01_lauren_tan.html`：專屬第 1 講（10 頁，聚焦倒金字塔與確定性防護）。
  - `slides_02_andrew_ng.html`：專屬第 2 講（8 頁，聚焦 Agentic Workflows 與四大設計模式）。
- **重構簡報專區與導覽選單**：
  - `wiki/presentation.md` 升級為「教學簡報總覽目錄（Presentation Hub）」。
  - 新增 `wiki/presentation_01.md` 與 `wiki/presentation_02.md` 專屬獨立預覽與全螢幕播放頁面。
  - 在側邊欄 `_sidebar.md` 列出獨立簡報項，並在各影片精讀筆記頂部提供直接播放入口。


## [2026-11-24] ingest | Shipping 1,000s of PRs a Month at SpaceX — Lauren Tan
- 原始英文字幕存入 `raw/Shipping_1000s_Of_PRs_A_Month_At_SpaceX_Lauren_Tan.txt`（URL: https://www.youtube.com/live/MN9dGgmLyso，共 1,707 行，時長 65 分鐘）。
- **依據使用者要求全面免除影片截圖**：專注於高純度文本分析、隱喻拆解、架構合約、以及純卡片排版。
- **撰寫結構化深度訪談精讀筆記**：`wiki/videos/Shipping_1000s_Of_PRs_A_Month_At_SpaceX_Lauren_Tan.md`：
  - 核心哲學：解析 Commercial Kitchen & Mise en Place（備料台）隱喻，揭秘鈍刀與摩擦如何摧毀生產力。
  - 組織治理：提煉「Context, Not Control」原則，解釋為何微觀控制必然失敗，以及充沛上下文與硬約束的結合方式。
  - 實戰閉環：解析「Watch Your Agent Like a Hawk」與客觀評分體系（Karpathy Loop）如何推動單月數千 PR 交付。
- **建立全新核心概念頁面**：
  - `wiki/concepts/agent-skills-architecture.md`（Agent Skills 架構哲學與可組合合約）。
- **產出專屬獨立教學 HTML 簡報**：
  - 建立專屬獨立簡報 `slides_03_spacex_lauren_tan.html`（共 8 頁，無 Emoji 圖標、無截圖、純卡片指標排版）。
  - 新增 `wiki/presentation_03.md` 專屬獨立預覽與外連頁面，並同步登錄至 Presentation Hub 與全域側邊欄。


## [2026-11-24] upgrade | 深度擴充第 3 講 65 分鐘訪談萬字精讀與 13 頁獨立簡報
- **大幅擴充深度精讀筆記**：針對 65 分鐘（1,707 行逐字稿）進行深度解剖，擴充為萬字級完整文檔：
  - 詳細整理 11 大完整時間軸（從「人肉代理」覺醒、語言本質、新原料、上下文預算、消除壞狀態、Dune 框架、內外循環打通、海量 PR 統計抽檢、調光開關隱喻到 Skills 組合哲學）。
  - 增設 4 大工程隱喻對照表與 3 大尖銳現場 Q&A 實戰答辯。
- **專屬獨立簡報擴充至 13 頁**：
  - `slides_03_spacex_lauren_tan.html` 全面涵蓋 Meat Proxy、Mise en Place、Dimmer Switch、Dune 框架、內外循環、Sampling Inspection 與 Skills 合約，零 Emoji、零截圖，保持最高純淨排版。


## [2026-11-24] schema update | 將長片深度門檻與獨立簡報規則固化至 AGENTS.md
- **實踐黃金反饋法則**：依據使用者對長篇訪談內容深度的質疑，將防錯機制直接寫入 `AGENTS.md`：
  1. **形態分流與密度門檻**：長片（>30 分鐘或 >500 行逐字稿）強制執行 11 段時間軸分解、核心隱喻對照表、尖銳現場 Q&A 拆解與 2,500 字以上深度下限，徹底杜絕泛泛摘要。
  2. **一影片一獨立簡報原則**：強制每部影片產出獨立 Reveal.js 簡報檔案（`slides_0X_{slug}.html`），杜絕接續串聯模式。
  3. **視覺純淨度硬約束**：全專案嚴禁使用任何 Emoji 圖標或裝飾性截圖，一律採用卡片與指標排版。

## [2026-11-24] ingest | What Are AI Agents? Agentic Systems Explained — Stanford CS329Z (Lecture 1)
- **原始逐字稿存檔**：`raw/What_Are_AI_Agents_Agentic_Systems_Explained_Stanford_CS329Z.txt`（URL: https://youtu.be/DGI4vucR71w，時長 70 分鐘，共 2,384 行逐字稿）。
- **關鍵投影片抽幀 (Keyframe Extraction)**：使用 `yt-dlp` 與 `ffmpeg` 抽取 5 張 1080p 原生無損 PPT 投影片，存放於 `wiki/assets/What_Are_AI_Agents_Stanford_CS329Z/`：
  1. `fig1_swe_bench_evolution.png`：SWE-bench Verified 2024–2025 準確率躍升（30% 至 80%+）
  2. `fig2_agent_triad_architecture.png`：現代代理認知架構對齊（Lilian Weng 2023 vs. Sumers & Yao 2024）
  3. `fig3_cot_vs_react_failure_modes.png`：CoT vs. ReAct 故障模式實證拆解（HotpotQA / Fever 幻覺 0%）
  4. `fig4_tool_use_pipeline.png`：工具調用解剖學四步管線（Select -> Arguments -> Validate -> Execute）
  5. `fig5_agent_failure_layers.png`：代理工程三層架構體系（System, Data, Evals）
- **高密度精讀筆記產出**：`wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md`：
  - 全景時序 12 段深度拆解（涵蓋師資背景、Russell & Norvig 經典定義、三代演進、三大架構、ReAct 思考行動交織、階層記憶系統、Toolformer 到 Schema 規範化、三層除錯、Operator 買牛奶危機）。
  - 圖表四步深度解析（5 張圖完整視覺組件、數據機制流向、設計意圖、量化結論）。
  - 史丹佛課堂 3 大尖銳問答（模型能力飽和 vs 測試時計算、推論錯誤 47% vs 幻覺 0% 之謎、Operator 買牛奶真實事故與確認門檻）。
  - 核心量化成果矩陣（SWE-bench 80%、幻覺率降至 0%、長鏈條任務誤差級聯 $(0.95)^{20} \approx 35.8\%$）。
- **提煉核心概念頁面**：
  - `wiki/concepts/agent-cognitive-architecture.md`（Agent 認知架構：大腦、階層記憶與環境閉環）
  - `wiki/concepts/tool-use-and-execution-sandbox.md`（Tool Use 工具調用解剖學與安全執行沙盒）
- **獨立 Reveal.js 教學簡報產出**：
  - 建立專屬獨立簡報 `slides_04_stanford_cs329z.html`（共 12 頁，純卡片排版、雙色左右邊框對比、零 Emoji、零雜截圖）。
  - 建立 `wiki/presentation_04.md` 獨立預覽頁面，並同步登記至 `wiki/presentation.md` 總目錄與全域側邊欄 `_sidebar.md`。

## [2026-11-24] ingest | From AI Infrastructure to the 6G Future — Ronnie Vasishta (NVIDIA GTC Berlin)
- **原始逐字稿存檔**：`raw/From_AI_Infrastructure_to_the_6G_Future.txt`（URL: https://youtu.be/yLMjEpMio2w，時長 38 分鐘，共 829 行逐字稿）。
- **模態判斷與視覺純淨度規範**：該影片為現場舞台演講，舞台畫面為單一講者與實體伺服器，無全螢幕簡報圖表覆蓋。嚴格遵守 `AGENTS.md` 規範：**全面杜絕講者人頭截圖與雜亂視訊截圖**，將精力 100% 傾注於高密度技術架構與數據分析。
- **高密度精讀筆記產出**：`wiki/videos/From_AI_Infrastructure_to_the_6G_Future.md`（字數超過 3,100 字）：
  - 全景時序 12 段深度拆解（涵蓋 100 GW 電力與 100,000 個站點、德國電信 AI-RAN 先導、Agile Robots 邊緣控制、Orange 即時語音同傳、歐洲主權 AI 工廠、告別 ASIC 邁向軟體定義、NVIDIA MGX 2U 伺服器硬體規格、芬蘭 Elisa 多租戶共享、英國電信 BT 2027 商用、Sionna 開源模擬器與神經接收機、Nemotron 電信大模型與自治運維、Cisco/Nokia 生態結盟）。
  - 核心工程架構與硬體拓撲矩陣（對比 Legacy ASIC vs. 現代 AI-RAN vs. 未來 6G AI-Native 六大維度）。
  - 產學界尖銳工程問答（L1 微秒級延遲確定性與時間片隔離機制、TCO 經濟學反轉、神經接收機突破非線性失真）。
  - 關鍵量化成果矩陣（100 GW 電力、100k 站點、10-15% 上行增益至 2x 頻譜效率、sub-300ms 延遲、100% GPU 利用率）。
- **提煉核心概念頁面**：
  - `wiki/concepts/ai-ran-architecture-and-6g.md`（AI-RAN 軟體定義架構與 6G AI 原生網路演進）
  - `wiki/concepts/edge-ai-and-distributed-inference.md`（邊緣分散式 AI 推論與電信 GPU 多租戶架構）
- **獨立 Reveal.js 教學簡報產出**：
  - 建立專屬獨立簡報 `slides_05_nvidia_ai_ran_6g.html`（共 12 頁，純卡片排版、綠/藍/紅左邊框卡片、零 Emoji、零雜截圖）。
  - 建立 `wiki/presentation_05.md` 獨立預覽頁面，並同步更新至 `wiki/presentation.md` 總目錄與全域側邊欄 `_sidebar.md`。
- **里程碑達成**：正式累積完成 5 部前沿 AI 影片之高密度精讀、概念拓撲與獨立簡報生成。
