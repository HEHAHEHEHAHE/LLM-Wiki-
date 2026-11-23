# 第 4 講教學 HTML 簡報：What Are AI Agents? Agentic Systems Explained (Stanford CS329Z)

> 授課教師：Prof. Diyi Yang（楊笛一）· 史丹佛大學計算機科學系助理教授 / SALT 實驗室  
> 共同授課：John Yang（SWE-bench 創始人）· Michael Ryan（DSPy 核心貢獻者）  
> 主題：史丹佛體系：從語言模型到自主代理系統的認知架構與工程落地

---

### 獨立全螢幕播放

<div style="margin: 20px 0;">
  <a href="slides_04_stanford_cs329z.html?v=clean_20261124" target="_blank" style="display: inline-block; background-color: #0284c7; color: #ffffff; padding: 12px 24px; border-radius: 6px; text-decoration: none; font-weight: 600; font-size: 1rem; box-shadow: 0 2px 6px rgba(2, 132, 199, 0.3);">全螢幕開啟第 4 講教學簡報 (另開新分頁)</a>
</div>

---

### 簡報內嵌預覽 (共 12 頁，支援鍵盤方向鍵翻頁)

<iframe src="slides_04_stanford_cs329z.html?v=clean_20261124" width="100%" height="650px" frameborder="0" allowfullscreen="true" style="border: 1px solid #cbd5e1; border-radius: 8px; margin-top: 15px; box-shadow: 0 4px 12px rgba(15, 23, 42, 0.08);"></iframe>

---

### 簡報章節與設計對應說明
- **第 1 頁**：史丹佛 CS329Z 課程背景與師資（Diyi Yang 教授、SWE-bench 創始人 John Yang、DSPy 貢獻者 Michael Ryan）
  - 對應筆記：[What Are AI Agents? - I. 1. 課程設立動機與教學陣容](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 2 頁**：迷思與真相：從無狀態 LLM 轉換器到微型認知作業系統
  - 對應筆記：[What Are AI Agents? - Executive Summary](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 3 頁**：理論基石：Stuart Russell & Peter Norvig 經典代理定義在現代 AI 的實體轉化
  - 對應筆記：[What Are AI Agents? - I. 2. 代理經典定義與現代範式轉移](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 4 頁**：技術演進：符號專家系統 $\to$ 強化學習代理 $\to$ 語言認知代理
  - 對應筆記：[What Are AI Agents? - I. 3. 代理演進史](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 5 頁**：認知架構對齊 (The Agent Triad)：大腦推理、階層記憶與工具環境介面
  - 對應章節：[What Are AI Agents? - II. Figure 2: 現代代理認知架構對齊](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
  - 對應概念：[Agent 認知架構：大腦、階層記憶與環境閉環](wiki/concepts/agent-cognitive-architecture.md)
- **第 6 頁**：破除幻覺：ReAct 推理與行動交織如何將 CoT 56% 的幻覺率壓制至 0%
  - 對應章節：[What Are AI Agents? - II. Figure 3: 推理與反思的實證故障模式拆解](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 7 頁**：史丹佛課堂思辨：為何 ReAct 幻覺為 0%，但推理錯誤（Reasoning Error）依然高達 47%？
  - 對應章節：[What Are AI Agents? - III. 史丹佛現場尖銳問答 Q2](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 8 頁**：記憶系統雙軌模型：工作記憶、情境記憶 (Episodic) 與語意記憶 (Semantic)
  - 對應筆記：[What Are AI Agents? - I. 7. 記憶架構全景](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 9 頁**：工具調用解剖學四步流水線：Select $\to$ Arguments $\to$ Validate $\to$ Execute
  - 對應章節：[What Are AI Agents? - II. Figure 4: 工具調用解剖學四步管線](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
  - 對應概念：[Tool Use 工具調用解剖學與安全執行沙盒](wiki/concepts/tool-use-and-execution-sandbox.md)
- **第 10 頁**：除錯體系：代理工程三層架構體系（系統層、資料層、評估層）
  - 對應章節：[What Are AI Agents? - II. Figure 5: 代理工程三層架構體系](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 11 頁**：真實事故案例與防護欄：OpenAI Operator 買牛奶危機與不可逆操作確認門檻 (Confirmation Gates)
  - 對應章節：[What Are AI Agents? - III. 史丹佛現場尖銳問答 Q3](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
- **第 12 頁**：終局思考：SWE-bench 80%+ 躍升關鍵，測試時計算（Test-time Compute）與確定性架構防護欄
  - 對應章節：[What Are AI Agents? - IV. 關鍵量化指標與工程成果](wiki/videos/What_Are_AI_Agents_Stanford_CS329Z.md)
