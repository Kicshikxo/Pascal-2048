procedure InitializeComponent;
    begin
        self.components := new System.ComponentModel.Container();
        var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
        self.ControlPanel := new System.Windows.Forms.Panel();
        self.MinimizeButton := new System.Windows.Forms.Panel();
        self.CloseButton := new System.Windows.Forms.Panel();
        self.MainPanel := new System.Windows.Forms.Panel();
        self.ResultLabel := new System.Windows.Forms.Label();
        self.NewGameButtonBlock := new System.Windows.Forms.Panel();
        self.NewGameButton := new System.Windows.Forms.Label();
        self.GamePictureBox := new System.Windows.Forms.PictureBox();
        self.GameBackgroundPictureBox := new System.Windows.Forms.PictureBox();
        self.ScoreBlock := new System.Windows.Forms.Panel();
        self.ScoreLabel := new System.Windows.Forms.Label();
        self.ScoreBlockTitle := new System.Windows.Forms.Label();
        self.BestScoreBlock := new System.Windows.Forms.Panel();
        self.BestScoreLabel := new System.Windows.Forms.Label();
        self.BestScoreBlockTitle := new System.Windows.Forms.Label();
        self.Title := new System.Windows.Forms.Label();
        self.MainGameTimer := new System.Windows.Forms.Timer(self.components);
        self.ControlPanel.SuspendLayout();
        self.MainPanel.SuspendLayout();
        self.NewGameButtonBlock.SuspendLayout();
        (System.ComponentModel.ISupportInitialize(self.GamePictureBox)).BeginInit();
        (System.ComponentModel.ISupportInitialize(self.GameBackgroundPictureBox)).BeginInit();
        self.ScoreBlock.SuspendLayout();
        self.BestScoreBlock.SuspendLayout();
        self.SuspendLayout();
        // 
        // ControlPanel
        // 
        self.ControlPanel.BackColor := System.Drawing.Color.Transparent;
        self.ControlPanel.Controls.Add(self.MinimizeButton);
        self.ControlPanel.Controls.Add(self.CloseButton);
        self.ControlPanel.Dock := System.Windows.Forms.DockStyle.Top;
        self.ControlPanel.Location := new System.Drawing.Point(0, 0);
        self.ControlPanel.Margin := new System.Windows.Forms.Padding(0);
        self.ControlPanel.Name := 'ControlPanel';
        self.ControlPanel.Size := new System.Drawing.Size(480, 29);
        self.ControlPanel.TabIndex := 0;
        self.ControlPanel.MouseDown += ControlPanel_MouseDown;
        self.ControlPanel.MouseMove += ControlPanel_MouseMove;
        self.ControlPanel.MouseUp += ControlPanel_MouseUp;
        // 
        // MinimizeButton
        // 
        self.MinimizeButton.BackgroundImage := (System.Drawing.Image(resources.GetObject('MinimizeButton.BackgroundImage')));
        self.MinimizeButton.Dock := System.Windows.Forms.DockStyle.Right;
        self.MinimizeButton.Location := new System.Drawing.Point(390, 0);
        self.MinimizeButton.Name := 'MinimizeButton';
        self.MinimizeButton.Size := new System.Drawing.Size(45, 29);
        self.MinimizeButton.TabIndex := 3;
        self.MinimizeButton.MouseClick += MinimizeButton_MouseClick;
        self.MinimizeButton.MouseEnter += MinimizeButton_MouseEnter;
        self.MinimizeButton.MouseLeave += MinimizeButton_MouseLeave;
        // 
        // CloseButton
        // 
        self.CloseButton.BackgroundImage := (System.Drawing.Image(resources.GetObject('CloseButton.BackgroundImage')));
        self.CloseButton.Dock := System.Windows.Forms.DockStyle.Right;
        self.CloseButton.Location := new System.Drawing.Point(435, 0);
        self.CloseButton.Name := 'CloseButton';
        self.CloseButton.Size := new System.Drawing.Size(45, 29);
        self.CloseButton.TabIndex := 2;
        self.CloseButton.MouseClick += CloseButton_MouseClick;
        self.CloseButton.MouseEnter += CloseButton_MouseEnter;
        self.CloseButton.MouseLeave += CloseButton_MouseLeave;
        // 
        // MainPanel
        // 
        self.MainPanel.Controls.Add(self.ResultLabel);
        self.MainPanel.Controls.Add(self.NewGameButtonBlock);
        self.MainPanel.Controls.Add(self.GamePictureBox);
        self.MainPanel.Controls.Add(self.GameBackgroundPictureBox);
        self.MainPanel.Controls.Add(self.ScoreBlock);
        self.MainPanel.Controls.Add(self.BestScoreBlock);
        self.MainPanel.Controls.Add(self.Title);
        self.MainPanel.Dock := System.Windows.Forms.DockStyle.Fill;
        self.MainPanel.Location := new System.Drawing.Point(0, 29);
        self.MainPanel.Name := 'MainPanel';
        self.MainPanel.Size := new System.Drawing.Size(480, 571);
        self.MainPanel.TabIndex := 1;
        // 
        // ResultLabel
        // 
        self.ResultLabel.BackColor := System.Drawing.Color.Transparent;
        self.ResultLabel.Font := new System.Drawing.Font('Arial', 64, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel, (System.Byte(204)));
        self.ResultLabel.ForeColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(117)))), (System.Int32((System.Byte(111)))), (System.Int32((System.Byte(104)))));
        self.ResultLabel.Location := new System.Drawing.Point(40, 131);
        self.ResultLabel.Name := 'ResultLabel';
        self.ResultLabel.Size := new System.Drawing.Size(400, 400);
        self.ResultLabel.TabIndex := 8;
        self.ResultLabel.Text := 'Game over!';
        self.ResultLabel.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.ResultLabel.Visible := false;
        // 
        // NewGameButtonBlock
        // 
        self.NewGameButtonBlock.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(143)))), (System.Int32((System.Byte(123)))), (System.Int32((System.Byte(105)))));
        self.NewGameButtonBlock.Controls.Add(self.NewGameButton);
        self.NewGameButtonBlock.Location := new System.Drawing.Point(345, 82);
        self.NewGameButtonBlock.Name := 'NewGameButtonBlock';
        self.NewGameButtonBlock.Size := new System.Drawing.Size(95, 30);
        self.NewGameButtonBlock.TabIndex := 6;
        self.NewGameButtonBlock.Paint += NewGameButtonBlock_Paint;
        // 
        // NewGameButton
        // 
        self.NewGameButton.Dock := System.Windows.Forms.DockStyle.Fill;
        self.NewGameButton.Font := new System.Drawing.Font('Arial Black', 14, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Pixel, (System.Byte(204)));
        self.NewGameButton.ForeColor := System.Drawing.Color.White;
        self.NewGameButton.Location := new System.Drawing.Point(0, 0);
        self.NewGameButton.Name := 'NewGameButton';
        self.NewGameButton.Size := new System.Drawing.Size(95, 30);
        self.NewGameButton.TabIndex := 0;
        self.NewGameButton.Text := 'New Game';
        self.NewGameButton.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        self.NewGameButton.Click += NewGame;
        // 
        // GamePictureBox
        // 
        self.GamePictureBox.BackColor := System.Drawing.Color.Transparent;
        self.GamePictureBox.Location := new System.Drawing.Point(40, 131);
        self.GamePictureBox.Name := 'GamePictureBox';
        self.GamePictureBox.Size := new System.Drawing.Size(400, 400);
        self.GamePictureBox.TabIndex := 5;
        self.GamePictureBox.TabStop := false;
        self.GamePictureBox.MouseDown += GamePictureBox_MouseDown;
        self.GamePictureBox.MouseMove += GamePictureBox_MouseMove;
        self.GamePictureBox.MouseUp += GamePictureBox_MouseUp;
        // 
        // GameBackgroundPictureBox
        // 
        self.GameBackgroundPictureBox.BackColor := System.Drawing.Color.Transparent;
        self.GameBackgroundPictureBox.Location := new System.Drawing.Point(40, 131);
        self.GameBackgroundPictureBox.Name := 'GameBackgroundPictureBox';
        self.GameBackgroundPictureBox.Size := new System.Drawing.Size(400, 400);
        self.GameBackgroundPictureBox.TabIndex := 4;
        self.GameBackgroundPictureBox.TabStop := false;
        // 
        // ScoreBlock
        // 
        self.ScoreBlock.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(202)))), (System.Int32((System.Byte(185)))), (System.Int32((System.Byte(180)))));
        self.ScoreBlock.Controls.Add(self.ScoreLabel);
        self.ScoreBlock.Controls.Add(self.ScoreBlockTitle);
        self.ScoreBlock.Location := new System.Drawing.Point(245, 21);
        self.ScoreBlock.Name := 'ScoreBlock';
        self.ScoreBlock.Size := new System.Drawing.Size(95, 43);
        self.ScoreBlock.TabIndex := 3;
        self.ScoreBlock.Paint += ScoreBlock_Paint;
        // 
        // ScoreLabel
        // 
        self.ScoreLabel.Dock := System.Windows.Forms.DockStyle.Bottom;
        self.ScoreLabel.Font := new System.Drawing.Font('Arial', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel, (System.Byte(204)));
        self.ScoreLabel.ForeColor := System.Drawing.Color.White;
        self.ScoreLabel.Location := new System.Drawing.Point(0, 20);
        self.ScoreLabel.Name := 'ScoreLabel';
        self.ScoreLabel.Padding := new System.Windows.Forms.Padding(0, 0, 0, 2);
        self.ScoreLabel.Size := new System.Drawing.Size(95, 23);
        self.ScoreLabel.TabIndex := 1;
        self.ScoreLabel.Text := '0';
        self.ScoreLabel.TextAlign := System.Drawing.ContentAlignment.BottomCenter;
        // 
        // ScoreBlockTitle
        // 
        self.ScoreBlockTitle.Dock := System.Windows.Forms.DockStyle.Top;
        self.ScoreBlockTitle.Font := new System.Drawing.Font('Arial', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel, (System.Byte(204)));
        self.ScoreBlockTitle.ForeColor := System.Drawing.Color.White;
        self.ScoreBlockTitle.Location := new System.Drawing.Point(0, 0);
        self.ScoreBlockTitle.Name := 'ScoreBlockTitle';
        self.ScoreBlockTitle.Size := new System.Drawing.Size(95, 23);
        self.ScoreBlockTitle.TabIndex := 0;
        self.ScoreBlockTitle.Text := 'Score';
        self.ScoreBlockTitle.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // BestScoreBlock
        // 
        self.BestScoreBlock.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(202)))), (System.Int32((System.Byte(185)))), (System.Int32((System.Byte(180)))));
        self.BestScoreBlock.Controls.Add(self.BestScoreLabel);
        self.BestScoreBlock.Controls.Add(self.BestScoreBlockTitle);
        self.BestScoreBlock.Location := new System.Drawing.Point(345, 21);
        self.BestScoreBlock.Name := 'BestScoreBlock';
        self.BestScoreBlock.Size := new System.Drawing.Size(95, 43);
        self.BestScoreBlock.TabIndex := 2;
        self.BestScoreBlock.Paint += BestScoreBlock_Paint;
        // 
        // BestScoreLabel
        // 
        self.BestScoreLabel.Dock := System.Windows.Forms.DockStyle.Bottom;
        self.BestScoreLabel.Font := new System.Drawing.Font('Arial', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel, (System.Byte(204)));
        self.BestScoreLabel.ForeColor := System.Drawing.Color.White;
        self.BestScoreLabel.Location := new System.Drawing.Point(0, 20);
        self.BestScoreLabel.Name := 'BestScoreLabel';
        self.BestScoreLabel.Padding := new System.Windows.Forms.Padding(0, 0, 0, 2);
        self.BestScoreLabel.Size := new System.Drawing.Size(95, 23);
        self.BestScoreLabel.TabIndex := 3;
        self.BestScoreLabel.Text := '0';
        self.BestScoreLabel.TextAlign := System.Drawing.ContentAlignment.BottomCenter;
        // 
        // BestScoreBlockTitle
        // 
        self.BestScoreBlockTitle.Dock := System.Windows.Forms.DockStyle.Top;
        self.BestScoreBlockTitle.Font := new System.Drawing.Font('Arial', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel, (System.Byte(204)));
        self.BestScoreBlockTitle.ForeColor := System.Drawing.Color.White;
        self.BestScoreBlockTitle.Location := new System.Drawing.Point(0, 0);
        self.BestScoreBlockTitle.Name := 'BestScoreBlockTitle';
        self.BestScoreBlockTitle.Size := new System.Drawing.Size(95, 23);
        self.BestScoreBlockTitle.TabIndex := 2;
        self.BestScoreBlockTitle.Text := 'Best';
        self.BestScoreBlockTitle.TextAlign := System.Drawing.ContentAlignment.MiddleCenter;
        // 
        // Title
        // 
        self.Title.AutoSize := true;
        self.Title.Font := new System.Drawing.Font('Arial', 60, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Pixel, (System.Byte(204)));
        self.Title.ForeColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(117)))), (System.Int32((System.Byte(111)))), (System.Int32((System.Byte(104)))));
        self.Title.Location := new System.Drawing.Point(30, 7);
        self.Title.Name := 'Title';
        self.Title.Size := new System.Drawing.Size(162, 70);
        self.Title.TabIndex := 0;
        self.Title.Text := '2048';
        // 
        // MainGameTimer
        // 
        self.MainGameTimer.Enabled := true;
        self.MainGameTimer.Interval := 1;
        self.MainGameTimer.Tick += MainGameTimer_Tick;
        // 
        // MainForm
        // 
        self.BackColor := System.Drawing.Color.FromArgb((System.Int32((System.Byte(254)))), (System.Int32((System.Byte(248)))), (System.Int32((System.Byte(241)))));
        self.ClientSize := new System.Drawing.Size(480, 600);
        self.Controls.Add(self.MainPanel);
        self.Controls.Add(self.ControlPanel);
        self.DoubleBuffered := true;
        self.FormBorderStyle := System.Windows.Forms.FormBorderStyle.None;
        self.Icon := (System.Drawing.Icon(resources.GetObject('$this.Icon')));
        self.MaximizeBox := false;
        self.MaximumSize := new System.Drawing.Size(480, 600);
        self.MinimumSize := new System.Drawing.Size(480, 600);
        self.Name := 'MainForm';
        self.StartPosition := System.Windows.Forms.FormStartPosition.CenterScreen;
        self.Text := '2048';
        self.Load += MainForm_Load;
        self.ControlPanel.ResumeLayout(false);
        self.MainPanel.ResumeLayout(false);
        self.MainPanel.PerformLayout();
        self.NewGameButtonBlock.ResumeLayout(false);
        (System.ComponentModel.ISupportInitialize(self.GamePictureBox)).EndInit();
        (System.ComponentModel.ISupportInitialize(self.GameBackgroundPictureBox)).EndInit();
        self.ScoreBlock.ResumeLayout(false);
        self.BestScoreBlock.ResumeLayout(false);
        self.ResumeLayout(false);
    end;
