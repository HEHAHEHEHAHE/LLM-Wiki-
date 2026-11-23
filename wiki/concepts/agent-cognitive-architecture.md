# Agent 認知架構：大腦、階層記憶與環境閉環 (Agent Cognitive Architecture)

> 核心定義：將基底大語言模型（LLM）作為核心處理單元（CPU/Brain），整合推理規劃模組、階層式記憶系統（工作/情境/語意記憶）與外部環境交互介面（Tools/Actuators），形成具備自主決策與自我修正能力的微型作業系統。

---

## 一、 架構本質：從語言模型到智慧實體

在人工智慧經典理論（Russell & Norvig）中，代理（Agent）被定義為「能透過感測器感知環境，並透過致動器改變環境狀態的自主實體」。

傳統 LLM 僅是無狀態的文字轉換器（Stateless Token Predictor）。現代代理認知架構（Cognitive Language Agent，Sumers & Yao 2024 / Lilian Weng 2023）透過在 LLM 外圍封裝狀態管理與控制迴圈，完成了從「文本生成器」到「認知決策實體」的躍遷：

```
                    ┌────────────────────────────────────────┐
                    │          環境 (Environment)            │
                    └────┬──────────────────────────────▲─────┘
                         │ 觀察 (Observations)          │ 行動 (Actions)
                         ▼                              │
┌───────────────────────────────────────────────────────┴────────────────────────────────┐
│ 代理認知架構 (Agent Cognitive Architecture)                                             │
│                                                                                        │
│   ┌────────────────────────────────────────────────────────────────────────────────┐   │
│   │ 階層式記憶系統 (Hierarchical Memory System)                                    │   │
│   │  • 工作記憶 (Working Memory / Context Window)                                  │   │
│   │  • 情境記憶 (Episodic Memory / Past Execution Traces)                           │   │
│   │  • 語意記憶 (Semantic Memory / Knowledge Vector DB)                            │   │
│   └──────────────────────▲──────────────────────────┬──────────────────────────────┘   │
│                          │ 檢索 (Retrieval)         │ 寫入 (Storage / Synthesis)       │
│                          ▼                          ▼                                  │
│   ┌────────────────────────────────────────────────────────────────────────────────┐   │
│   │ 核心大腦：推理與規劃模組 (The Brain: Reasoning & Planning)                      │   │
│   │  • 子目標分解 (Subgoal Decomposition)                                          │   │
│   │  • 推理與行動交織 (ReAct Loop: Thought -> Action -> Observation)                │   │
│   │  • 動態反思與自我評判 (Reflection & Self-Critique)                              │   │
│   └─────────────────────────────────────────┬──────────────────────────────────────┘   │
│                                             │ 決定工具呼叫 (Tool Selection)             │
│                                             ▼                                          │
│   ┌────────────────────────────────────────────────────────────────────────────────┐   │
│   │ 工具與致動器介面 (Tools & Actuators Interface)                                 │   │
│   │  • 檔案系統讀寫 (File I/O)      • 終端腳本執行 (Bash / Sandbox)                │   │
│   │  • 網路瀏覽與檢索 (Web / DOM)   • 外部軟體 API (REST / JSON-RPC)               │   │
│   └────────────────────────────────────────────────────────────────────────────────┘   │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## 二、 核心三大支柱詳解

### 1. 核心大腦：規劃與推理 (Reasoning & Planning)
- **子目標分解 (Subgoal Decomposition)**：將高維度複雜目標（如「修復開源倉庫中的 Bug」）拆解為可執行的微小任務拓撲序列。
- **ReAct 範式 (Reasoning + Acting)**：將內部邏輯思考與外部環境觀察交織。模型每產生一步推論（Thought），必須發動一次環境操作（Action），並在接收到真實返回結果（Observation）後才決定下一步思考。
- **自我反思 (Self-Reflection / Reflexion)**：在執行失敗或遭遇異常時，將錯誤軌跡存入上下文，觸發批判性評估（Evaluator）以動態調整後續行動策略。

### 2. 階層式記憶系統 (Hierarchical Memory System)
- **工作記憶 (Working Memory)**：基於 Attention 視窗的當前會話狀態。容量有限且代價昂貴，隨對話增加需進行滑動視窗修剪或壓縮。
- **情境記憶 (Episodic Memory)**：儲存歷史執行的任務路徑、過往成敗案例與使用者個人互動習慣（如 Stanford Generative Agents 的 25 個虛擬市民日常模擬）。提供少樣本示範（In-context Demonstrations）的檢索來源。
- **語意記憶 (Semantic Memory)**：儲存通用世界常識、工程法典手冊與程式碼規範庫。通常透過外部向量資料庫（Vector Database）或階層檢索索引（RAG）進行按需召回。

### 3. 工具與環境介面 (Tools & Actuators)
- 代理與純聊天機器人的分水嶺在於「對客觀世界的改變能力（Actuation）」。
- 透過結構化定義（JSON Schema），大腦能輸出具備強型別參數的調用指令，經由安全沙盒驅動底層作業系統與外部服務。

---

## 三、 工程權衡與關鍵考量

1. **幻覺與推理錯誤的分野**：
   - 純提示詞（CoT）面臨 56% 的高事實幻覺；
   - 引入認知架構與環境閉環後，客觀事實幻覺可降至 0%，但因工具呼叫漂移與重試死循環，推理錯誤率（Reasoning Error）仍需透過上層規劃演算法（如 Reflexion, MCTS）持續優化。
2. **上下文視窗爆炸與成本控制**：
   - 隨著推理輪次增加，工作記憶的 Token 消耗呈現非線性累積。必須引入記憶體摘要壓縮（Context Compaction）機制，將冗長軌跡濃縮為高密度狀態特徵。

---

## 四、 關聯主題
- [[tool-use-and-execution-sandbox|Tool Use 工具調用解剖學與安全執行沙盒]]
- [[ai-agentic-patterns|AI Agentic 四大設計模式]]
- [[deterministic-guardrails|確定性防護欄 (Deterministic Guardrails)]]
- [What Are AI Agents? Stanford CS329Z (Lecture 1)](../videos/What_Are_AI_Agents_Stanford_CS329Z.md)
