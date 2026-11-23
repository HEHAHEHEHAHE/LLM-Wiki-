# AI Agentic 四大設計模式 (Four AI Agentic Design Patterns)

> 核心定義：由 Andrew Ng（吳恩達）系統性歸納的代理工作流架構分類學，包含 Reflection（自我反思）、Tool Use（工具調用）、Planning（動態規劃）與 Multi-agent Collaboration（多代理協同）。

---

## 一、 架構背景與重要性

在傳統 LLM 應用中，系統多採用 **Non-agentic Zero-shot Prompting** 模式，即模型在單次前向傳播中從頭到尾生成結果，缺乏迭代除錯空間。

Agentic Design Patterns 將「一次性生成」轉化為「狀態機閉環迭代」，使較小或較便宜的模型（如 GPT-3.5）能在複雜編程基準（如 HumanEval）上大幅超越未具備工作流增強的旗艦模型（如 GPT-4 Zero-shot）。

---

## 二、 四大核心設計模式詳析

### 1. Reflection（自我反思模式）
- **機制**：模型將第一輪輸出作為輸入，切換視角進行批判性審查（Criticism），主動偵測邏輯漏洞、邊界條件缺失或語法錯誤。
- **實踐形式**：
  - **Dual-Prompting**：分別扮演 Generator 與 Reviewer。
  - **Test-Driven Reflection**：由代碼執行器執行單元測試，將報錯資訊回傳作為反思依據。
- **成本與效益**：實施成本最低，僅需增加 1–2 次對話輪次，即可消除超過 60% 的顯淺型別與邊界失誤。

### 2. Tool Use（工具調用模式）
- **機制**：模型主動辨識意圖，生成結構化指令調用外部環境（Web Search、Calculator、Code Interpreter、REST APIs）。
- **實踐形式**：Function Calling、Model Context Protocol (MCP)。
- **成本與效益**：將 LLM 從「知識記憶庫」解放為「通用協調器（Orchestrator）」，根除數值計算失真與時效性知識盲區。

### 3. Planning（動態規劃模式）
- **機制**：面對多步驟複雜任務，Agent 先進行高階分解（Sub-goal Decomposition），動態決定執行拓撲順序，並在執行遇阻時動態回溯重構。
- **代表性範式**：Plan-and-Solve、Tree of Thoughts (ToT)、HuggingGPT。
- **挑戰**：長路徑規劃容易出現累積誤差與目標飄移（Goal Drift），需配合確定性驗證關卡約束。

### 4. Multi-agent Collaboration（多代理協同模式）
- **機制**：將複雜組織架構投影至多個專職 Agent，各自具備獨立的 System Prompt、記憶體與評估標準，透過訊息對話協商完成交付。
- **代表性範式**：ChatDev、CrewAI、AutoGen。
- **成本與效益**：顯著降低單一 Prompt 難以兼顧全域與局部細節的認知過載，但通訊協商與 Token 消耗顯著提升。

---

## 三、 模式成熟度與工程權衡

| 維度 | Reflection | Tool Use | Planning | Multi-Agent |
| :--- | :--- | :--- | :--- | :--- |
| **落地成熟度** | 極高（已成為工業界標準） | 高（主流 API 原生支援） | 中（需嚴格防禦漂移） | 中（需控制協商 Token 膨脹） |
| **Token 開銷** | 低 (+50% ~ +100%) | 中 (+100% ~ +300%) | 高 (+300% ~ +500%) | 極高 (+500% ~ +1000%) |
| **確定性依賴** | 需搭配單元測試驗證 | 需搭配環境 Sandbox | 需搭配 DAG 圖驗證 | 需搭配協作邊界規範 |

---

## 四、 交叉文獻與延伸引用

- **出處文獻**：[What's next for AI agentic workflows (Andrew Ng)](../videos/Whats_Next_For_AI_Agentic_Workflows_Andrew_Ng.md)
- **架構防護互聯**：[[deterministic-guardrails|確定性防護欄與編譯約束 (Deterministic Guardrails)]]
- **規模化應用**：[[ai-agents-code-generation|AI Agents 規模化代碼生成體系 (Scaling AI Coding Agents)]]
- **基礎設施支援**：[[fast-token-generation|高速 Token 生成對代理架構的影響 (Fast Token Generation)]]
