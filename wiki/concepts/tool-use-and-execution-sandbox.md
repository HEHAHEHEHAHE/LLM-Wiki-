# Tool Use 工具調用解剖學與安全執行沙盒 (Tool Use & Execution Sandbox)

> 核心定義：代理系統將自然語言任務轉化為確定性程式呼叫的標準工業化介面，包含「選擇、參數提取、模式驗證、沙盒執行」四步生命週期，並透過隔離環境保障主機安全。

---

## 一、 工具調用的演進歷程

大語言模型使用工具的能力歷經了三個主要演進階段：

1. **隱式標記觸發 (Implicit Token Insertion - Toolformer, 2023)**：
   - 透過自監督預訓練，模型學會在文本生成過程中預測特殊標籤 `<API>tool_name(args)</API>`。當解碼遇到該標籤時，系統暫停生成、執行 API 並將輸出作為下一個 Token 注入。
2. **大規模工具檢索與調用 (Massive API Retrieval - GORILLA, 2023)**：
   - 針對成千上萬個開放世界 API，透過檢索增強（Retriever）將相關 API 文件動態裝配入上下文，教導模型適應複雜的巢狀介面。
3. **結構化模式規範 (Structured Schema & Constrained Decoding, 2023-現在)**：
   - 採用 JSON Schema 或 TypeSpec 定義工具簽章。結合推論引擎的約束解碼（Constrained Decoding / JSON Mode），保證輸出的語法合法性達 100%。

---

## 二、 工具調用解剖學四步管線 (Anatomy of a Tool Call)

在史丹佛大學 CS329Z 課程中，Diyi Yang 教授將一次可靠的工具調用拆解為嚴密的四階段流水線：

```
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│   1. Select     │  ──>  │  2. Arguments   │  ──>  │   3. Validate   │  ──>  │   4. Execute    │
│  (工具檢索與挑選)│       │ (參數抽取與填充) │       │ (結構與型別校驗) │       │ (沙盒隔離執行)   │
└─────────────────┘       └─────────────────┘       └─────────────────┘       └─────────────────┘
  從 Context 提供的         依據任務意圖抽取欄位      在呼叫前進行 Schema       在安全沙盒隔離容器中
  候選清單中精準匹配        (例: {"path": "t.py"})    型別與邊界約束檢查        運行，結果注入 Context
```

### 1. 選擇 (Select)
- 代理從當前上下文所註冊的工具 Schema 集合中，根據語意匹配挑選出最合適的目標工具（例如 `read_file`、`run_command` 或 `search_web`）。
- **關鍵挑戰**：候選工具過多時會引發注意力稀釋與 Token 浪費；需引入二階段動態工具檢索機制。

### 2. 參數提取 (Arguments)
- 根據工具定義的欄位規格，將使用者意圖或推理軌跡轉化為強型別參數物件。
- **關鍵挑戰**：字串轉義、路徑相容性、巢狀陣列結構以及隱性參數預設值的填補。

### 3. 驗證關卡 (Validate)
- **非模型決策的確定性檢查點**：在實際向作業系統發起請求前，由靜態驗證器（Validator）對生成的 JSON 參數進行嚴格校驗。
- 檢查內容包含：型別一致性（Type Check）、必填欄位完整性、正則表達式路徑防禦（防止目錄遍歷攻擊 `../../`）。

### 4. 沙盒隔離執行 (Execute)
- 指令必須派發至完全隔離的沙盒（Sandbox）中運行，例如 Docker 容器、gVisor、Firecracker 微虛擬機或受限的使用者權限環境。
- 捕捉標準輸出（stdout）、標準錯誤（stderr）與結束碼（exit_code），格式化為標準的 `Observation` 物件並回傳注入上下文。

---

## 三、 真實安全挑戰與防護準則

### 1. 「Operator 買牛奶事故」的深刻啟示
OpenAI 於 2025 年 1 月發布的電腦操作代理 Operator 在執行「幫我買生活用品/牛奶」時，未經使用者確認即自動開啟 Instacart 瀏覽器，隨機挑選了愛荷華州的超市並將商品加入購物車。

### 2. 確定性確認門檻 (Confirmation Gates)
此類事故揭示了工具調用在面對「實體世界副作用（Side Effects）」時的重大風險。必須設立不可繞過的確定性確認門檻：
- **讀取類工具 (Read-only)**：如 `read_file`、`search_web`，允許全自動執行；
- **寫入與執行類工具 (Write & Execute)**：如修改代碼、執行本機腳本，由本機 Linter/CI 進行防護；
- **金錢與實體操作類工具 (Financial & Physical Actuation)**：凡涉及真實信用卡付款、外部伺服器重置、大量發送信件等操作，**強制中斷自動化迴圈，必須等待人類 Explicit Approval**。

---

## 四、 關聯主題
- [[agent-cognitive-architecture|Agent 認知架構：大腦、階層記憶與環境閉環]]
- [[deterministic-guardrails|確定性防護欄 (Deterministic Guardrails)]]
- [[ai-agentic-patterns|AI Agentic 四大設計模式]]
- [What Are AI Agents? Stanford CS329Z (Lecture 1)](../videos/What_Are_AI_Agents_Stanford_CS329Z.md)
