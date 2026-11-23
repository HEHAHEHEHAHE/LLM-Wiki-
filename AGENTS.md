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
[原始影片 / 逐字稿 (raw/)] 
       │
       ▼
[關卡 1: Ingest Lint (名詞校正 & 消除 ASR 錯誤)] ──(失敗)──> [小圈 1: Terminology 修復]
       │ (通過)
       ▼
[判斷影片型態 (模態分流: 演講 PPT 抽幀 vs 訪談深度文本)]
       │
       ▼
[關卡 2: 深度與密度檢查 (長片強制 11 段時間軸 + Q&A)] ─(太簡略)─> [小圈 2: 深入逐字稿補齊細節]
       │ (達標: 字數與深度充足)
       ▼
[寫入 wiki/videos/ 深度精讀筆記 & 提煉 wiki/concepts/]
       │
       ▼
[生成專屬獨立 Reveal.js 教學簡報 (slides_0X_{slug}.html)]
       │
       ▼
[關卡 3: 簡報合規檢查 (獨立檔案、零 Emoji、零雜截圖)] ──(違規)──> [小圈 3: 修正為純卡片排版]
       │ (通過)
       ▼
[更新總目錄 index.md、側邊欄 _sidebar.md、追加 log.md 並提交 Git]
```

---

## 4. 影片分類處理與深度密度門檻 (Content Density Guardrails)

為避免 AI 代理產生「浮於表面之泛泛摘要」，本專案依據影片時長與形態設立強制性的**內容密度門檻**：

### A. 形態分流規則 (Modality Taxonomy)
1. **投影片演講類 (Keynotes / Slide Talks，如 15–20 分鐘精華)**：
   - 必須啟動 `ffmpeg` 高清抽幀，為每張重要投影片執行「圖表四步深度解析」（視覺組件、數據機制流向、設計意圖、量化結論）。
2. **深度訪談與播客類 (Podcasts / Long Interviews，如 30–60+ 分鐘長片)**：
   - **全面禁絕人物大頭貼或無意義視訊截圖**，將注意力 100% 聚焦於技術細節挖掘。
   - **強制時間軸分段 (Chronological Breakdown)**：必須以 5–10 分鐘為區間，梳理出 8 至 12 個具體探討主題。
   - **強制隱喻對照表 (Metaphor Matrix)**：將受訪者提出的工程隱喻對齊至實際軟體工廠實踐。
   - **強制現場尖銳 Q&A 拆解**：至少收錄 3 個具體工程爭議問題與講者答辯。
   - **字數門檻**：深度精讀筆記字數不得低於 2,500 字，必須窮盡逐字稿關鍵論據。

### B. 一影片一獨立簡報原則 (Decoupled Slide Deck Architecture)
- **嚴禁將多部影片串接在同一份簡報中**！每部影片必須擁有專屬的獨立簡報檔案：`slides_0X_{video_slug}.html`（8–15 頁）。
- 在 `wiki/` 建立對應的獨立預覽頁面：`wiki/presentation_0X.md`，並登錄至 `wiki/presentation.md` 總覽目錄與全域側邊欄。
- 簡報內嵌與外部連結必須帶有版本後綴（`?v=...`），徹底杜絕瀏覽器快取舊版問題。

### C. 視覺純淨度標準 (Visual Purity & Minimalist Standards)
- **零 Emoji 與特殊圖標**：側邊欄、筆記標題、投影片內文嚴禁使用任何表情符號（如 🚫, ✅, ⚠️, 📖, 🎬 等），回歸純粹字體層次與極簡學術風格。
- **純卡片排版**：投影片完全採用雙色卡片、數值指標與文字對比排版，不放任何非必要的裝飾性圖片。

---

## 5. 影片深度解析標準模板（`wiki/videos/{Video_Slug}.md`）

每部影片筆記必須完整填寫以下標準章節：

1. **Metadata 標頭**：Title, Speaker, Host/Conference, Video URL, Duration, Tags, Interactive Presentation Link。
2. **Executive Summary (TL;DR)**：2–3 句濃縮核心突破、實戰結論與量化指標。
3. **I. 核心論點 / 全景時間軸拆解**：演講類列出核心命題；訪談類列出 8–12 個時序段落深入分析。
4. **II. 圖表四步深度解析 或 核心工程隱喻對照表**：依影片形態選擇圖表四步法或隱喻對照矩陣。
5. **III. 實戰踩坑、內部框架細節或現場尖銳 Q&A**：揭秘未公開的架構細節（如 Dune 框架、內外循環閉環）。
6. **IV. 關鍵量化指標與工程成果 (Quantitative Benchmarks)**：列出具體交付數據、吞吐量與效益。
7. **V. 概念互聯 (Cross-Referenced Concepts)**：使用 `[[wikilink]]` 雙向鏈結至 `wiki/concepts/`。

---

## 6. 衝突與矛盾處理原則
若不同影片講者之觀點產生分歧，必須在對應概念頁面設立「觀點分歧與權衡（Trade-offs & Divergence）」區塊，客觀對比雙方立論條件，不單方面進行取捨。

---

## 7. 演講實踐指導原則：Poteto 防護模型與黃金反饋法則
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
