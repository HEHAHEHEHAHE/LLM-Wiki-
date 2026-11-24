# 🎬 AI Video-to-Wiki Knowledge Base & Educational Slide Graph

[![GitHub Pages](https://img.shields.io/badge/Deployment-GitHub%20Pages-blue.svg)](https://pages.github.com/)
[![Architecture](https://img.shields.io/badge/Pattern-Karpathy%20LLM%20Wiki-success.svg)](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
[![Schema](https://img.shields.io/badge/Schema-AGENTS.md-orange.svg)](AGENTS.md)
[![Presentations](https://img.shields.io/badge/Slides-Reveal.js-red.svg)](wiki/presentation.md)

An autonomous, persistent, multi-modal **AI Video-to-Wiki** academic knowledge base and modular educational HTML presentations (Reveal.js) focusing on **AI Engineering**, **Autonomous Agentic Workflows**, **Deterministic Guardrails**, and **Software Factory Architecture**.

---

## 🌟 核心特色 (Key Features)

1. **Karpathy 三層架構 (Three-Layer Architecture)**：
   - `raw/`：不可變原始層，存放 YouTube 原始英文字幕逐字稿與元數據。
   - `wiki/`：活體知識層，由 AI 代理維護（`videos/` 精讀筆記、`concepts/` 概念網絡、`presentation_0X.md` 獨立簡報預覽）。
   - `AGENTS.md`：規範法典層，定義形態分流門檻（長片強制 12 段時序拆解 + 3 大尖銳 Q&A）、零 Emoji 視覺純淨度與左移驗證（Shift-Left Verification）。
2. **一影片一獨立簡報 (Decoupled Slide Deck Architecture)**：
   - 每部精讀影片均配備專屬的獨立 Reveal.js 簡報檔案（`slides_0X_{slug}.html`），支援全螢幕演示、縮圖預覽與鍵盤方向鍵。
   - 每張投影片底部嚴格標註對應之 Wiki 章節出處（Ground Truth Citations）。
3. **純靜態與無伺服器部署 (Zero-Build Serverless Deployment)**：
   - 基於 **Docsify** + **KaTeX** + **Reveal.js**，支援即時推送到 **GitHub Pages** 免建置自動發布。

---

## 📂 目錄結構 (Directory Layout)

```text
├── .nojekyll                          # 繞過 GitHub Pages Jekyll 建置引擎
├── AGENTS.md                          # AI 代理規範法典與工作流 Graph 定義
├── index.html                         # Docsify 前端入口 (KaTeX 渲染、全域搜尋、快取防止)
├── README.md                          # 專案說明與導覽
├── _sidebar.md                        # 全域側邊欄導覽
├── 啟動預覽.bat                        # 本機一鍵啟動背景預覽腳本 (靜音無黑窗)
├── slides_01_lauren_tan.html          # 第 1 講獨立 Reveal.js 教學簡報 (10 頁)
├── slides_02_andrew_ng.html           # 第 2 講獨立 Reveal.js 教學簡報 (8 頁)
├── slides_03_spacex_lauren_tan.html   # 第 3 講獨立 Reveal.js 教學簡報 (13 頁)
├── slides_04_stanford_cs329z.html     # 第 4 講獨立 Reveal.js 教學簡報 (12 頁)
├── slides_05_nvidia_ai_ran_6g.html    # 第 5 講獨立 Reveal.js 教學簡報 (12 頁)
├── raw/                               # 不可變原始資料層 (逐字稿)
│   ├── All_Code_Is_Slop_Except_Mine_Lauren_Tan.txt
│   ├── Whats_Next_For_AI_Agentic_Workflows_Andrew_Ng.txt
│   ├── Shipping_1000s_Of_PRs_A_Month_At_SpaceX_Lauren_Tan.txt
│   ├── What_Are_AI_Agents_Agentic_Systems_Explained_Stanford_CS329Z.txt
│   └── From_AI_Infrastructure_to_the_6G_Future.txt
└── wiki/                              # 活體知識庫
    ├── index.md                       # 知識庫首頁與影片索引目錄
    ├── log.md                         # 時序 Ingest 審計日誌
    ├── presentation.md                # 教學簡報專區總覽 (Presentation Hub)
    ├── presentation_01.md ~ 05.md     # 各講簡報專屬內嵌預覽頁面
    ├── videos/                        # 影片深度精讀筆記 (IMRaD + 全時序 + Q&A)
    │   ├── All_Code_Is_Slop_Except_Mine_Lauren_Tan.md
    │   ├── Whats_Next_For_AI_Agentic_Workflows_Andrew_Ng.md
    │   ├── Shipping_1000s_Of_PRs_A_Month_At_SpaceX_Lauren_Tan.md
    │   ├── What_Are_AI_Agents_Stanford_CS329Z.md
    │   └── From_AI_Infrastructure_to_the_6G_Future.md
    └── concepts/                      # 跨影片提煉之核心技術網絡
        ├── ai-ran-architecture-and-6g.md
        ├── edge-ai-and-distributed-inference.md
        ├── agent-cognitive-architecture.md
        ├── tool-use-and-execution-sandbox.md
        ├── agent-skills-architecture.md
        ├── agentic-design-patterns.md
        ├── deterministic-guardrails.md
        ├── ai-agents-code-generation.md
        ├── formal-verification-llm.md
        └── fast-token-generation.md
```

---

## 🎬 影片精讀與簡報清單 (Video & Presentation Catalog)

| # | 影片名稱 | 講者與會議 | 核心技術突破 | 關鍵量化成果 | 獨立簡報 | 精讀筆記 |
| :- | :--- | :--- | :--- | :--- | :--- | :--- |
| **01** | **All Code Is Slop (Except Mine)** | Lauren Tan (xAI / Grok) | 倒金字塔確定性防護模型、全面禁用逃生門註解 | 單月 11,000 PRs，Revert 率約 0.5% | [第 1 講簡報](slides_01_lauren_tan.html) | [第 1 講筆記](wiki/videos/All_Code_Is_Slop_Except_Mine_Lauren_Tan.md) |
| **02** | **What's Next for AI Agentic Workflows** | Andrew Ng (AI Fund) | 迭代式 Agent 工作流、四大設計模式 (Reflection, Tools, Planning, Multi-agent) | GPT-3.5 超越 GPT-4，HumanEval > 80% | [第 2 講簡報](slides_02_andrew_ng.html) | [第 2 講筆記](wiki/videos/Whats_Next_For_AI_Agentic_Workflows_Andrew_Ng.md) |
| **03** | **Shipping 1,000s of PRs a Month at SpaceX** | Lauren Tan (SpaceX / pstack) | 擺脫人肉代理 (Meat Proxy)、後廚備料台 (Mise en Place)、Dune 消除壞狀態 | 單月數千 PR 交付、架構重構 10x 加速 | [第 3 講簡報](slides_03_spacex_lauren_tan.html) | [第 3 講筆記](wiki/videos/Shipping_1000s_Of_PRs_A_Month_At_SpaceX_Lauren_Tan.md) |
| **04** | **What Are AI Agents? Agentic Systems Explained** | Diyi Yang (Stanford CS329Z) | 代理認知架構 (The Agent Triad)、ReAct 行動閉環、Tool Use 四步管線 | 消除 56% 事實幻覺至 0%、SWE-bench 80%+ | [第 4 講簡報](slides_04_stanford_cs329z.html) | [第 4 講筆記](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md) |
| **05** | **From AI Infrastructure to the 6G Future** | Ronnie Vasishta (NVIDIA GTC) | 軟體定義 AI-RAN、邊緣 GPU 多租戶共享、Sionna 神經接收機 6G 演化 | 100 GW 電力、100k 站點、頻譜效率 2x 翻倍 | [第 5 講簡報](slides_05_nvidia_ai_ran_6g.html) | [第 5 講筆記](wiki/videos/From_AI_Infrastructure_to_the_6G_Future.md) |

---

## 🚀 本機預覽 (Local Preview)

本專案支援雙點擊 `啟動預覽.bat`（自動啟動背景伺服器並開啟瀏覽器），或透過標準 Python 指令啟動：

```powershell
# 進入專案目錄啟動靜態伺服器
python -m http.server 4000
```
瀏覽器訪問：`http://localhost:4000/#/wiki/index`

---

## 🌐 部署至 GitHub Pages (Deploy to GitHub Pages)

1. 將本專案推送至 GitHub 倉庫。
2. 進入倉庫 **Settings** > **Pages**。
3. 在 **Branch** 選取 `main`，目錄維持 `/(root)`，點選 **Save**。
4. 約 1 分鐘後即可透過 `https://<username>.github.io/<repo-name>/` 存取完整網站。
