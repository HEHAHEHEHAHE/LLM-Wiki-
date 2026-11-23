# AGENTS.md - AI 影音知識庫與教學簡報規範法典 (Video-to-Wiki & Slide Graph)

> **專案使命**：  
> 建立一個持續累積、模組化可擴展的 AI 影音學術與工程知識庫（Video-to-Wiki）。本專案以優質英文 AI 講座/訪談為輸入源，進行多模態與逐字稿結構化精讀，建立相互鏈結的概念網絡（Obsidian / Docsify 雙相容），並作為唯一真實來源（Single Source of Truth），驅動生成給初學者理解的互動式教學 HTML 簡報（Reveal.js）。

---

## 1. 三層架構原則

1. **`raw/`（不可變原始層）**：  
   - 存放 YouTube 原始英文字幕逐字稿、時間戳記紀錄及投影片 OCR 文字。**僅允許讀取與追加，嚴禁修改或刪除既有檔案**。
2. **`wiki/`（活躍知識層）**：  
   - 由 AI 負責維護：
     - `wiki/videos/`：各部影片的深度精讀筆記（時間軸、核心論點、實戰案例）。
     - `wiki/concepts/`：跨影片提煉之核心技術與概念頁面（如 `ai-agents-code-generation`, `deterministic-guardrails`）。
     - `wiki/index.md`：全局影片目錄與概念索引。
     - `wiki/log.md`：時序操作日誌（Append-only）。
3. **`AGENTS.md`（規範法典）**：  
   - 本檔案即為 AI 代理運作的最高準則，定義資料格式、語言標準、校正迴圈與簡報生成邊界。

---

## 2. 語言與專有名詞規範（繁中說明 + 英文保留）

- **語言標準**：所有摘要、說明與教學內容全面採用 **繁體中文** 撰寫。
- **專有名詞強制保留英文**（嚴禁任意意譯）：
  - 核心架構：`AI Agents`, `Codebase`, `Pull Request (PR)`, `Prompt Engineering`, `Context Window`。
  - 軟體工程與約束：`Deterministic Checks`, `Lint Rules`, `Type Systems`, `Compilers`, `Anti-pattern`, `Refactoring`。
  - 驗證方法：`Runtime Verification`, `Formal Verification (TLA+, Lean)`, `Invariant`, `Revert Rate`。
  - 特殊術語：`Code Slop`, `AGENTS.md`, `Software Factory`, `Grokbot`, `Cursor`。

---

## 3. Graph 工作流與檢查關卡（Workflow Graph & Checkpoints）

本專案落實「大圈很少轉，小圈轉得快」之 Graph 設計：

```
[原始影片/逐字稿] 
       │
       ▼
[關卡 1: Ingest Lint (名詞校正 & 消除 ASR 聽寫錯誤)] ──(失敗)──> [小圈 1: Terminology 修復]
       │ (通過)
       ▼
[寫入 raw/ 與 wiki/videos/ 深度精讀筆記]
       │
       ▼
[提取/更新 wiki/concepts/ 核心概念與雙向鏈結]
       │
       ▼
[檢索 Wiki 生成教學大綱 (8~15 頁架構)]
       │
       ▼
[關卡 2: 覆蓋率與出處檢查 (每頁必須有 Wiki 對應)] ──(失敗)──> [小圈 2: 補足 Wiki 引用]
       │ (通過)
       ▼
[渲染 Reveal.js 教學 HTML 簡報 (slides.html)]
       │
       ▼
[關卡 3: 渲染檢查 (字體不溢出、排版合規)] ───────────(失敗)──> [小圈 3: 調整 Slide 樣式]
       │ (通過)
       ▼
[交付成果與推播 GitHub]
```

---

## 4. 影片深度解析模板（`wiki/videos/{Video_Slug}.md`）

每部影片筆記必須包含以下六大章節：

1. **Metadata 標頭**：Title, Speaker, Conference/Channel, URL, Duration, Tags。
2. **Executive Summary (TL;DR)**：2–3 句濃縮核心突破與實戰結論。
3. **I. 核心論點與背景動機 (Core Thesis & Motivation)**：為什麼過去的做法會失敗？講者主張的新範式是什麼？
4. **II. 核心架構與分層拆解 (Architecture Deep Dive)**：系統性拆解講者提出的層級模型（如逆金字塔、防護欄等）。
5. **III. 實戰踩坑與反模式案例 (Real-World Anti-Patterns & Case Studies)**：列舉具體在生產環境遇到的真實負面案例與修復手段。
6. **IV. 關鍵量化指標與法則 (Quantitative Findings & Golden Rules)**：具體數據（PR 數量、Rollback 率、各層投入比例）。
7. **V. 概念互聯 (Cross-Referenced Concepts)**：使用 `[[wikilink]]` 鏈結至 `wiki/concepts/`。

---

## 5. 衝突與矛盾處理原則
若不同影片講者之觀點產生分歧，必須在對應概念頁面設立「觀點分歧與權衡（Trade-offs & Divergence）」區塊，客觀對比雙方立論條件，不單方面進行取捨。

---

## 6. 演講實踐指導原則：Poteto 防護模型與黃金反饋法則
依據 Lauren Tan《All Code Is Slop (Except Mine)》演講實戰精髓，本專案在人機協同與知識庫維護中全面貫徹以下工程準則：

1. **倒金字塔資源配置 (The Poteto Pyramid)**：
   - **Layer 1: Codebase & Architecture (投資最大)**：確保目錄劃分（`raw/`, `wiki/videos/`, `wiki/concepts/`）與檔案命名嚴格物理隔離，杜絕跨層混雜。
   - **Layer 2: Deterministic Guardrails (確定性檢查)**：語音 ASR 辨識錯誤一律透過專案字典進行確定性置換（如 `ploy crust` $\to$ `Pull Request`），不依賴隨機文字猜測。
   - **Layer 3: Verification (真實性驗證)**：重要論點、量化數據與架構拆解，必須有影片原生 PPT 抽幀或逐字稿直接佐證，落實圖表四步深度解析。
   - **Layer 4: Prose (極簡規則法典)**：本規範（`AGENTS.md`）追求明確、確定與機器可執行，避免模糊冗長、充滿主觀詮釋的提示詞。
   - **Layer 5: Human Review (壓縮人工審查)**：當前置確定性關卡足夠嚴密時，人類審查心力將壓縮至尖端，達成高信任度交付。

2. **工程師的黃金反饋法則 (The Golden Feedback Rule)**：
   - **「每一次當使用者需要手動糾正 AI 的錯誤時，絕對不要只把修正留在單次對話框中；必須立即將其提煉並寫入 `AGENTS.md` 的確定性檢查關卡或更新模板規範！」**

3. **消除「花園雜草」與「禁用逃生門註解」**：
   - Codebase 即為 Agent 的長期記憶（Code is memory）。專案內嚴禁遺留任何臨時應急的 Workaround、殘破格式或自我辯解之註解。一旦發現反模式，立即從根源重構消除，杜絕 Agent 進行病毒式自我複製。
