# Agent Skills 架構哲學與可組合合約 (Agent Skills as Software Contracts)

> 核心定義：在自主 AI 代理架構中，Skills 是將特定工程領域的最佳實踐、環境上下文與確定性工具調用進行模組化封裝的軟體合約（Software Contracts），旨在消除 Agent 重複探索世界的算力浪費，並提供可預測的行為邊界。

---

## 一、 核心痛點：Agent 的「重複探索世界」浪費

在傳統 Agent 協同中，開發者常遇到以下瓶頸：
1. **認知重置（Context Blindness）**：每個新生成的 Agent 對代碼庫都是一張白紙，需要反覆耗費 10 至 20 輪對話去探尋「測試怎麼跑、目錄怎麼分、後端服務如何啟動」。
2. **行為漂移（Behavioral Divergence）**：同一個任務，不同模型或不同 Session 中的 Agent 採取完全不同的工具調用路徑，難以納入標準 CI/CD 流程。

Lauren Tan 在實踐中創立了 `pstack`，提出將常見的工程路徑固化為明確的 Skills。

---

## 二、 Skills 的本質：非魔法，而是可組合合約

### 1. 破除黑魔法迷思 (No Magic in Skills)
Skills 在實體上通常由三部分構成：
- **觸發條件（Trigger / Description）**：何時應該使用本 Skill。
- **上下文合約（Context & Pre-conditions）**：執行本操作所需的環境前提與資料結構。
- **確定性腳本或工具調用（Deterministic Scripts / Primitives）**：不可變的執行指令（如 `pytest`、`npm run lint`）。

### 2. 軟體合約特質 (Contractual Properties)
- **可組合性 (Composability)**：高階 Skill 可以調用低階 Skill（例如「Bug Triage Skill」調用「Local Reproduction Skill」再調用「Git Branch Skill」）。
- **可預測性 (Determinism)**：輸入與輸出的邊界清晰，大幅降低自然語言推論的隨機波動。

---

## 三、 Context, Not Control 在 Skills 設計中的實踐

| 微觀控制模式 (Micro-management) | 上下文合約模式 (Context, Not Control) |
| :--- | :--- |
| 在 Prompt 中寫滿上百條禁令（「不要調用 A，不要修改 B」） | 提供精準的架構依賴圖與唯讀邊界 |
| 試圖預先規定 Agent 每一步的思維鏈細節 | 建立客觀評判器（Linter、單元測試、型別檢查） |
| **結果**：Context 嚴重膨脹，模型注意力渙散而違規 | **結果**：Agent 擁有探索自主性，由環境充當硬邊界 |

---

## 四、 交叉文獻與延伸引用

- **出處訪談**：[Shipping 1,000s of PRs a Month at SpaceX (Lauren Tan)](../videos/Shipping_1000s_Of_PRs_A_Month_At_SpaceX_Lauren_Tan.md)
- **環境防護體系**：[[deterministic-guardrails|確定性防護欄與編譯約束 (Deterministic Guardrails)]]
- **推論模式整合**：[[agentic-design-patterns|AI Agentic 四大設計模式 (Four Design Patterns)]]
