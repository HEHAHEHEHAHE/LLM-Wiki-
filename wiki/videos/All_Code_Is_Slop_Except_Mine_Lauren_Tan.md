# All Code Is Slop (Except Mine)

- **Speaker**: Lauren Tan (Potato / @sugarpirate_, 前 Cursor 工程師、現任 xAI Grok Bot 團隊成員)
- **Conference / Channel**: AI Engineer
- **Video Link**: [YouTube: All Code Is Slop (Except Mine)](https://youtu.be/O_zcc6Xl12g)
- **Duration**: 17 分 31 秒
- **Keywords / Tags**: #AIAgents #CodeSlop #SoftwareArchitecture #LintRules #FormalVerification #DeterministicGuardrails #Cursor #GrokBot

---

## Executive Summary (TL;DR)
在前 Cursor 核心工程師、現任 xAI Grok Bot 團隊的 Lauren Tan 看來，當工程師全面引入 AI Agents 輔助開發時，軟體開發的範式已從「手動敲程式碼」轉化為「軟體工廠（Software Factory）的環境建構」。Lauren 分享了團隊單月由 AI 交付高達 11,000 個 Pull Requests (PR)、且回滾率（Revert Rate）僅約 0.5% 的驚人實戰成果。其核心秘訣在於打造**「高信任度的確定性約束環境」**：透過「Poteto 倒金字塔模型（5 層）」，將時間精力集中於頂層的代碼庫架構、靜態分析與形式化驗證，極小化自然語言 Prompt，最終將最底端的人工審查（Human Review）壓縮至趨近於零。

---

## I. 核心論點與背景動機 (Core Thesis & Motivation)

### 1. 現狀衝擊：從手動編程到「代碼洪流」
- **過去的工程步調**：在 2024 年以前，工程師一天審查 3 個同事寫的 PR 就算是正常工作量。
- **現在的 Agent 時代**：單一工程師身後運作著數百甚至數千個 AI Agents，每天產生的 PR 數量暴增至 300 到 3,000 個，代碼如同有機體（Organic Stream）般持續湧入。
- **核心挑戰**：AI Agents 產生程式碼的成本趨近於零，如果缺乏約束，這些代碼就會淪為毫無品質的「垃圾代碼（Code Slop）」。
- **工程師的新使命 (The New Meta)**：
  > 現代軟體工程師的核心職責，不再是親手寫代碼，而是**「在代碼生產力呈指數級爆發的同時，維持甚至大幅提升代碼庫的整體品質」**。

### 2. 花園隱喻 (The Garden Analogy)
Lauren 提出了一個深刻的隱喻：**Codebase 就像一座花園**。
- AI Agents 生成代碼時，最大的輸入依據就是現有的 Codebase。
- 如果你的花園裡長了雜草（未被清理的反模式、臨時應急的 Workaround、廢棄的過時寫法），Agent 在尋找參考範式時就會自動模仿並複製這些雜草。
- 在數千個 Agent 的並行擴散下，雜草幾天內就會淹沒整個系統。因此，軟體工程師的工作本質正轉變為**「花園的園丁（Gardening）」**——維持土壤純淨，架設剛性的混凝土支架（Constraints），讓新代碼依循正確的骨架生長。

---

## II. 核心架構：Agent 環境的「倒金字塔模型」 (The Poteto Pyramid)

Lauren 在演講中展示了原創的「Poteto 倒金字塔（5 層結構）」，解釋如何建立對 Agent 的信任：

```
╲                                                                     ╱
 ╲  1. Codebase (頂部最寬/耗資最大): Good API design, architecture   ╱
  ╲─────────────────────────────────────────────────────────────────╱
   ╲  2. Static Analysis: Lints, types, compilers, tests, CI       ╱
    ╲─────────────────────────────────────────────────────────────╱
     ╲  3. Verification: Formal verification, runtime invariants ╱
      ╲─────────────────────────────────────────────────────────╱
       ╲  4. Prose: Rules, skills, AGENTS.md (脆弱/需主觀判斷)  ╱
        ╲─────────────────────────────────────────────────────╱
         ╲  5. Human Review (底部尖端/最少): 追求趨近於零    ╱
          ╲                                                 ╱
           ▼
```

### 1. 第一層（最寬）：代碼庫本體 (Codebase: Good API Design, Architecture, Refactoring)
- **核心思維**：投入最大的成本在此層。透過極致優秀的架構重構，在根源上「直接消除犯錯的可能性（Categorical Elimination）」。
- 只要 API 設計得不易被誤用，Agent 想寫錯都很困難。

### 2. 第二層：靜態分析 (Static Analysis: Lints, Types, Compilers, Tests, CI)
- **工具鏈**：編譯器、嚴格型別、自動化測試、靜態分析與客製化 Lint 規則。
- **價值**：100% 可重現（Reproducible）。相比於在自然語言 Prompt 裡叮嚀，編譯器直接阻斷是絕對可信的防護欄。

### 3. 第三層：驗證體系 (Verification: Formal & Runtime)
- **方法**：運行時不變量（Runtime Invariants）檢查，以及針對關鍵狀態機使用 TLA+、Lean 進行形式化驗證。
- **價值**：證明系統核心屬性在任何極端情境下均成立。

### 4. 第四層：自然語言提示詞 (Prose: Rules, Skills, AGENTS.md)
- **內容**：Prompt 規範、技能指南等。
- **定位**：提示詞充滿模糊性，依賴隨機概率。能用 Lint 或 Type 解決的，絕不用 Prose 解決。

### 5. 第五層（最窄尖端）：人工審查 (Human Review)
- **終極目標**：在健康的 Agent 工廠中，人工 Review 的面積被壓縮到最底部的尖點（趨近於零），讓 90% 以上符合規範的 PR 自動合併。

---

## III. 實戰踩坑與反模式案例解析 (Real-World Anti-Patterns)

### 案例 1：React 的 `useEffect` 誤用
- **問題**：`useEffect` 需要高超的心智模型才能用好，Agent 極度缺乏這種細膩判斷力（Nuance），常寫出依賴項死迴圈或內存洩漏。
- **處方**：在內部框架（Dune）中，**直接在產品代碼全面禁用（Ban）`useEffect`**，僅允許在底層封裝中使用。此問題被直接從根源消滅。

### 案例 2：Electron 架構中的跨執行緒污染
- **問題**：Cursor 作為 Electron 應用，Agent 經常在前端渲染執行緒（Renderer Thread）中違法引入後端主執行緒（Main Thread）代碼，導致使用者介面發生長任務卡頓（Jank & Freeze）。
- **處方**：在專案根目錄設立物理目錄結構 `electron-renderer` 與 `electron-main`，並撰寫依賴關係圖分析器（Dependency Graph Lint Rule），嚴禁跨層引用。

### 案例 3：命令式定時器（Imperative Timers）的效能災難
- **問題**：Agent 遇到非同步競爭或狀態對齊困難時，極度喜歡使用 `setTimeout`、`requestAnimationFrame` 來當作「快速修復補丁（Quick Fix）」。
- **惡果**：成千上萬的定時器被高頻創建與銷毀，引發 JavaScript 垃圾回收（GC Pause）大卡頓；更可怕的是，**Agent 會在代碼中寫下註解（Comments）自我合理化這個不良寫法**，導致其他 Agent 瘋狂複製。

### 案例 4：代碼註解是「垃圾的溫床」 (Ban 99% of Comments)
- **重大顛覆**：團隊決定在生產環境**禁用 99% 的註解**！
- **理由**：註解無法被機器強制執行，且是 Agent 用來為偷懶找藉口的逃生門（Escape Hatch）。
- **替代方案**：將錯誤轉化為高質量的 Lint Error Message，直接告訴 Agent：「請修復造成這個問題的根本原因，禁止用應急手段繞過！」

---

## IV. 關鍵量化成效與黃金法則 (Quantitative Findings & Rules)

1. **極致交付數據**：
   - 單月交付成果：高達 **11,000 個 Pull Requests**。
   - 代碼回滾率（Revert Rate）：維持在極度嚴苛的 **~0.5%** 水準。
2. **工程師的黃金反饋迴圈 (The Golden Rule)**：
   > **「每一次當你需要手動糾正 Agent 的錯誤時，絕對不要只把錯誤寫進對話框；必須將其轉化為一條確定性的 Lint 規則、型別限制，或徹底重構 API 設計！」**

---

## V. 概念互聯 (Cross-Referenced Concepts)
- [[deterministic-guardrails|確定性防護欄與編譯約束 (Deterministic Guardrails)]]
- [[ai-agents-code-generation|AI Agents 規模化代碼生成體系 (Scaling AI Coding Agents)]]
- [[formal-verification-llm|形式化驗證在 AI 工程的應用 (Formal & Runtime Verification)]]
