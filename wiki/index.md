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
| 2 | What's Next for AI Agentic Workflows | Andrew Ng (吳恩達) | AI Fund / Sequoia AI Ascent | 迭代式 Agent 工作流、四大設計模式 (Reflection, Tools, Planning, Multi-agent) | GPT-3.5 + 工作流超越 GPT-4 Zero-shot，HumanEval > 80% | [閱讀精讀筆記](wiki/videos/Whats_Next_For_AI_Agentic_Workflows_Andrew_Ng.md) |
| 3 | Shipping 1,000s of PRs a Month at SpaceX | Lauren Tan (Potato) | SpaceX / xAI / pstack | 商業後廚備料台隱喻 (Mise en place)、Context Not Control 哲學、Skills 即軟體合約 | 單月數千 PR 交付、架構重構速度提升 10 倍 | [閱讀深度訪談筆記](wiki/videos/Shipping_1000s_Of_PRs_A_Month_At_SpaceX_Lauren_Tan.md) |

---

## 核心概念索引 (Core Concepts)

- [Agent Skills 架構哲學與可組合合約 (Agent Skills Architecture)](wiki/concepts/agent-skills-architecture.md)：pstack 理念、消除重複探索世界浪費、合約化封裝實踐。
- [AI Agentic 四大設計模式 (Agentic Design Patterns)](wiki/concepts/agentic-design-patterns.md)：Reflection、Tool Use、Planning 與 Multi-agent 之架構成熟度與權衡。
- [確定性防護欄 (Deterministic Guardrails)](wiki/concepts/deterministic-guardrails.md)：為何機械化 Linter 與編譯器檢查遠勝於自然語言 Prompt。
- [AI Agents 規模化代碼生成 (Scaling AI Coding Agents)](wiki/concepts/ai-agents-code-generation.md)：從 Copilot 到數千個 Agent 並行的軟體工廠範式轉變。
- [形式化驗證在 AI 工程的應用 (Formal & Runtime Verification)](wiki/concepts/formal-verification-llm.md)：TLA+、Lean 與不變量檢查如何建立終極信任。
- [高速 Token 生成對代理架構的關鍵影響 (Fast Token Generation)](wiki/concepts/fast-token-generation.md)：為何極速推論吞吐是支撐代理多次迭代反思的底層命脈。

---

## 時間活動日誌 (Recent Activity)
請參閱 [時間日誌 (wiki/log.md)](wiki/log.md) 查看最新 Ingest 與更新進度。
