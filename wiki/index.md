# AI 影音知識庫 (AI Video-to-Wiki Knowledge Base)

> **AI Engineering, Autonomous Agents & Software Factory 學術與實戰知識庫**  
> 採用 **Karpathy LLM Wiki 結構**，將前沿英文 AI 講座轉化為結構化知識網，支援 Obsidian 本機查閱與 Docsify 網頁導覽。

---

## 關於本知識庫 (About This Wiki)

本知識庫以「影音輸入 $\to$ 逐字稿校驗 $\to$ 結構化深度解析 $\to$ 概念網絡」之 Graph 工作流運作，專門研究現代 AI 輔助軟體開發、AI Agents 自主協作及代碼品質防護體系。

### 三層架構說明
1. **`raw/`（不可變原始資料）**：未經修改之 YouTube 英文逐字稿與演講元數據。
2. **`wiki/`（活躍知識庫）**：包含 `videos/` 深度筆記、`concepts/` 概念網絡、`index.md` 與 `log.md`。
3. **`AGENTS.md`（規範法典）**：指導 AI 代理進行 Ingest 校正、專有名詞保留與簡報生成之最高規範。

---

## 影片精讀目錄 (Video Catalog)

| # | 影片名稱 | 講者 | 組織 / 會議 | 核心技術突破 | 關鍵量化成果 | 筆記連結 |
| :- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | All Code Is Slop (Except Mine) | Lauren Tan (Potato) | AI Engineer / xAI Grok Bot | 倒金字塔確定性防護模型、全面禁用逃避性註解與高危語法 | 單月交付 11,000 PRs，Revert 率約 0.5% | [閱讀精讀筆記](wiki/videos/All_Code_Is_Slop_Except_Mine_Lauren_Tan.md) |

---

## 核心概念索引 (Core Concepts)

- [確定性防護欄 (Deterministic Guardrails)](wiki/concepts/deterministic-guardrails.md)：為何機械化 Linter 與編譯器檢查遠勝於自然語言 Prompt。
- [AI Agents 規模化代碼生成 (Scaling AI Coding Agents)](wiki/concepts/ai-agents-code-generation.md)：從 Copilot 到數千個 Agent 並行的軟體工廠範式轉變。
- [形式化驗證在 AI 工程的應用 (Formal & Runtime Verification)](wiki/concepts/formal-verification-llm.md)：TLA+、Lean 與不變量檢查如何建立終極信任。

---

## 時間活動日誌 (Recent Activity)
請參閱 [時間日誌 (wiki/log.md)](wiki/log.md) 查看最新 Ingest 與更新進度。
