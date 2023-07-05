Unit Game;

interface

uses System, System.Drawing, System.Windows.Forms;

type
  BlockClass = class;
  BlockAnimation = class;
  Directions = (Left, Right, Up, Down);
  AnimationTypes = (moveAnimation, collideAnimation, opacityAnimation);
  MainForm = class(Form)
    { Размеры игрового поля }
    xSize:integer := 4;
    ySize:integer := 4;
    { Время анимаций (в мс) }
    blockMoveAnimationDuration := 250;
    blockOpacityAnimationDuration := 150;
    
    Score, BestScore: integer;
    
    gameImage: Bitmap;
    gameGraphics: Graphics;
    backgroundImage: Bitmap;
    backgroundGraphics: Graphics;

    Blocks: List<BlockClass>;
    animationsStack: List<BlockAnimation>;
    BlockStringFormat: StringFormat;
    lastMoveTime: DateTime;

    x, y, dX, dY: integer;
    isWindowMoved: boolean;
    isMouseDown: boolean;

    procedure MainForm_Load(sender: Object; e: EventArgs);
    { Отрисовка }
    procedure MainGameTimer_Tick(sender: Object; e: EventArgs);
    procedure DrawBackground();
    procedure Draw();
    {Перемещение}
    function FindEndpoint(movingBlock: BlockClass; direction: Directions): Point;
    procedure MoveBlocks(direction: Directions);
    procedure collide(firstBlock, secondBlock: BlockClass; direction: Directions);
    { Управление }
    procedure GamePictureBox_MouseDown(sender: Object; e: MouseEventArgs);
    procedure GamePictureBox_MouseMove(sender: Object; e: MouseEventArgs);
    procedure GamePictureBox_MouseUp(sender: Object; e: MouseEventArgs);
    { Игровые приколдесы }
    procedure NewGame(sender: Object; e: EventArgs);
    procedure addBlock2(opacityAnimation: boolean);
    procedure addBlock(x, y, value: integer; opacityAnimation: boolean);
    procedure checkForLose();
    procedure showResultLabel(text: string);
    procedure setScore(newScore: integer);
    procedure increaseScore(value: integer);
    { Перерисовка элементов интефейса }
    procedure ScoreBlock_Paint(sender: Object; e: PaintEventArgs);
    procedure BestScoreBlock_Paint(sender: Object; e: PaintEventArgs);
    procedure NewGameButtonBlock_Paint(sender: Object; e: PaintEventArgs);
    { Управление окном }
    procedure ControlPanel_MouseDown(sender: Object; e: MouseEventArgs);
    procedure ControlPanel_MouseMove(sender: Object; e: MouseEventArgs);
    procedure ControlPanel_MouseUp(sender: Object; e: MouseEventArgs);
    procedure CloseButton_MouseEnter(sender: Object; e: EventArgs);
    procedure CloseButton_MouseLeave(sender: Object; e: EventArgs);
    procedure CloseButton_MouseClick(sender: Object; e: MouseEventArgs);
    procedure MinimizeButton_MouseEnter(sender: Object; e: EventArgs);
    procedure MinimizeButton_MouseLeave(sender: Object; e: EventArgs);
    procedure MinimizeButton_MouseClick(sender: Object; e: MouseEventArgs);
  {$region FormDesigner}
  internal
    {$resource Game.MainForm.resources}
    MainPanel: Panel;
    Title: &Label;
    BestScoreBlock: Panel;
    ScoreBlock: Panel;
    ScoreLabel: &Label;
    BestScoreLabel: &Label;
    BestScoreBlockTitle: &Label;
    GameBackgroundPictureBox: PictureBox;
    ScoreBlockTitle: &Label;
    GamePictureBox: PictureBox;
    MainGameTimer: Timer;
    components: System.ComponentModel.IContainer;
    NewGameButtonBlock: Panel;
    NewGameButton: &Label;
    CloseButton: Panel;
    MinimizeButton: Panel;
    ResultLabel: &Label;
    ControlPanel: Panel;
    {$include Game.MainForm.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;
  
  // Класс блоков
  BlockClass = class
    x, y: integer;
    Width := 85;
    Height := 85;
    opacity: byte := 255;
    Left, Top: integer;
    value: integer;
    isCollided: boolean := false;
    zIndex: integer := 0;
    BlockColor: Color;
    TextColor: Color := Color.White;
    
    Font: System.Drawing.Font;
    private FontSize: integer := 30;
    
    private procedure init(x, y: integer; value: integer; BlockColor, TextColor: Color);
    begin
      self.x := x;
      self.y := y;
      self.value := value;
      self.BlockColor := BlockColor;
      self.TextColor := TextColor;
      self.Left := 12 * self.x + 85 * (self.x - 1);
      self.Top  := 12 * self.y + 85 * (self.y - 1);
      self.Font := new System.Drawing.Font('Arial', self.FontSize);
    end;
  end;
  
  // Классы блоков с различными значениями
  Block2 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 2, Color.FromArgb(240, 228, 220), Color.FromArgb(120, 108, 99)); 
    end;
  end;
  Block4 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 4, Color.FromArgb(236, 224, 201), Color.FromArgb(120, 108, 99));
    end;
  end;
  Block8 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 8, Color.FromArgb(242, 176, 121), Color.White);
    end;
  end;
  Block16 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 16, Color.FromArgb(236, 141, 84), Color.White);
    end;
  end;
  Block32 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 32, Color.FromArgb(247, 123, 97), Color.White);
    end;
  end;
  Block64 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 64, Color.FromArgb(233, 89, 55), Color.White);
    end;
  end;
  Block128 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 128, Color.FromArgb(244, 216, 109), Color.White);
    end;
  end;
  Block256 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 256, Color.FromArgb(241, 208, 76), Color.White);
    end;
  end;
  Block512 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.init(x, y, 512, Color.FromArgb(236, 199, 91), Color.White);
    end;
  end;
  Block1024 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.FontSize := 24;
      self.init(x, y, 1024, Color.FromArgb(233, 193, 88), Color.White);
    end;
  end;
  Block2048 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.FontSize := 24;
      self.init(x, y, 2048, Color.FromArgb(236, 197, 1), Color.White);
    end;
  end;
  Block4096 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.FontSize := 24;
      self.init(x, y, 4096, Color.FromArgb(255, 213, 0), Color.White);
    end;
  end;
  Block8192 = class(BlockClass)
    constructor(x, y: integer);
    begin
      self.FontSize := 24;
      self.init(x, y, 8192, Color.FromArgb(255, 229, 0), Color.White);
    end;
  end;
  
  // Класс анимаций
  BlockAnimation = class
    Block, secondBlock: BlockClass;
    duration: integer;
    startTime: DateTime;
    animationType: AnimationTypes;
    
    startLeft, targetLeft: integer;
    startTop, targetTop: integer;
    startOpacity, targetOpacity: byte;
    
    procedure init(animationType: AnimationTypes; Block: BlockClass; duration: integer);
    begin
      self.animationType := animationType;
      self.startTime := DateTime.Now;
      self.Block := Block;
      self.duration := duration;
    end;
  end;

  // Анимация перемещения блоков
  BlockMoveAnimation = class(BlockAnimation)
    constructor(Block: BlockClass; x, y, duration: integer);
    begin
      init(AnimationTypes.moveAnimation, Block, duration);
      self.startLeft := Block.Left;
      self.startTop  := Block.Top;
      self.targetLeft := 12 * x + 85 * (x - 1);
      self.targetTop  := 12 * y + 85 * (y - 1);
    end;
  end;
  
  // Анимация столкновения блоков
  BlockCollideAnimation = class(BlockAnimation)
    constructor(Block, secondBlock: BlockClass; duration: integer);
    begin
      init(AnimationTypes.collideAnimation, Block, duration);
      self.secondBlock := secondBlock;
    end;
  end;
  
  // Анимация изменения непрозрачности блоков
  BlockOpacityAnimation = class(BlockAnimation)
    constructor(Block: BlockClass; startOpacity, targetOpacity: byte; duration: integer);
    begin
      init(AnimationTypes.opacityAnimation, Block, duration);
      Block.opacity := startOpacity;
      self.startOpacity := startOpacity;
      self.targetOpacity  := targetOpacity;
    end;
  end;
  
  animationsEasing = static class
    static function easeInOutSine(x: real):real;
    begin
       Result := -(cos(PI * x) - 1) / 2;
    end;
    static function easeOutElastic(x: real):real;
    const c4 = (2 * Pi) / 3;
    begin
       if (x = 0) then begin
         Result := 0;
       end
       else if (x = 1) then begin
         Result := 1
       end
       else begin
         Result := Power(2, -10 * x) * Sin((x * 10 - 0.75) * c4) + 1;
       end;
    end;
  end;

implementation

// Инициализация всякого при загрузке

procedure MainForm.MainForm_Load(sender: Object; e: EventArgs);
begin
  gameImage := new Bitmap(GamePictureBox.Width, GamePictureBox.Height);
  gameGraphics := Graphics.FromImage(gameImage);
  backgroundImage := new Bitmap(GameBackgroundPictureBox.Width, GameBackgroundPictureBox.Height);
  backgroundGraphics := Graphics.FromImage(backgroundImage);
  
  backgroundGraphics.SmoothingMode := System.Drawing.Drawing2D.SmoothingMode.HighQuality;
  gameGraphics.SmoothingMode := System.Drawing.Drawing2D.SmoothingMode.HighQuality;
  gameGraphics.TextRenderingHint :=  System.Drawing.Text.TextRenderingHint.AntiAlias;
  BlockStringFormat := new StringFormat();
  BlockStringFormat.Alignment := StringAlignment.Center;
  BlockStringFormat.LineAlignment := StringAlignment.Center;  
  
  DrawBackground;
  
  Blocks := new List<BlockClass>;
  animationsStack := new List<BlockAnimation>;
  
  NewGame(nil, nil);
  
  GamePictureBox.Parent := GameBackgroundPictureBox;
  GamePictureBox.Location := new Point(0, 0);
  GamePictureBox.Image := gameImage;
  GameBackgroundPictureBox.Image := backgroundImage;
  
  ResultLabel.Parent := GamePictureBox;
  ResultLabel.Location := new Point(0, 0);
  ResultLabel.Size := GamePictureBox.Size;
  ResultLabel.BackColor := Color.FromArgb(64, Color.White);
end;

// Начало новой игры
procedure MainForm.NewGame(sender: Object; e: EventArgs);
begin
  lastMoveTime := DateTime.Now;
  ResultLabel.Visible := false;
  Blocks.Clear;
  setScore(0);
  addBlock2(false);
  addBlock2(false);
  Draw;
end;

// Добавление блока с указанным значением в указанное место
procedure MainForm.addBlock(x, y, value: integer; opacityAnimation: boolean); 
begin
  var newBlock:BlockClass;
  
  if      (value = 2)    then newBlock := new Block2(x, y)
  else if (value = 4)    then newBlock := new Block4(x, y)
  else if (value = 8)    then newBlock := new Block8(x, y)
  else if (value = 16)   then newBlock := new Block16(x, y)
  else if (value = 32)   then newBlock := new Block32(x, y)
  else if (value = 64)   then newBlock := new Block64(x, y)
  else if (value = 128)  then newBlock := new Block128(x, y)
  else if (value = 256)  then newBlock := new Block256(x, y)
  else if (value = 512)  then newBlock := new Block512(x, y)
  else if (value = 1024) then newBlock := new Block1024(x, y)
  else if (value = 2048) then newBlock := new Block2048(x, y)
  else if (value = 4096) then newBlock := new Block4096(x, y)
  else if (value = 8192) then begin
    newBlock := new Block8192(x, y);
    showResultLabel('You win!');
  end
  else exit;
  
  Blocks.Add(newBlock);
  if (opacityAnimation) then animationsStack.Add(new BlockOpacityAnimation(newBlock, 0, 255, blockOpacityAnimationDuration));
end;

// Добавление блока со значением 2 в рандомную пустую клетку
procedure MainForm.addBlock2(opacityAnimation: boolean);
begin
  var x := PABCSystem.Random(1, xSize);
  var y := PABCSystem.Random(1, ySize);
  
  foreach var block in Blocks do begin
    if ((Block.x = x) and (Block.y = y)) then begin
      addBlock2(opacityAnimation);
      exit;
    end;
  end;
  
  addBlock(x, y, 2, opacityAnimation);
  Draw;
  
  if (Blocks.Count = xSize * ySize) then begin
    checkForLose;
  end;
end;

// Проверка на отсутствие ходов
procedure MainForm.checkForLose();
begin
  foreach var firstBlock in Blocks do begin
    foreach var secondBlock in Blocks do begin
      if ( 
         (firstBlock.value = secondBlock.value) and (
         ((Abs(firstBlock.x - secondBlock.x) = 1) and (firstBlock.y = secondBlock.y))   or 
         ((Abs(firstBlock.y - secondBlock.y) = 1) and (firstBlock.x = secondBlock.x)))) then exit;
    end;
  end;
  showResultLabel('Game over!');
end;

// Показ текста в конце игры
procedure MainForm.showResultLabel(text: string);
begin
  ResultLabel.Text := text;
  ResultLabel.Visible := true;
end;

// Поиск конечной точки движения блока
function MainForm.FindEndpoint(movingBlock: BlockClass; direction: Directions): Point; 
begin
  var offset: Point;
  if      (direction = Directions.Left)  then offset := new Point(-1, 0)
  else if (direction = Directions.Right) then offset := new Point( 1, 0)
  else if (direction = Directions.Up)    then offset := new Point( 0,-1)
  else if (direction = Directions.Down)  then offset := new Point( 0, 1)
  else exit;
  
  var x := movingBlock.x;
  var y := movingBlock.y;
  
  loop Max(xSize, ySize) do begin
    x += offset.X;
    y += offset.Y;
    
    if ((x < 1) or (x > xSize) or (y < 1) or (y > ySize)) then begin
      Result := new Point(x - offset.X, y - offset.Y);
      exit;
    end;
    
    foreach var block in Blocks do begin
      if (block = movingBlock) then continue;
      if ((block.x = x) and (block.y = y)) then begin
        if (not block.isCollided and (block.value = movingBlock.value)) then Result := new Point(x, y)
        else Result := new Point(x - offset.X, y - offset.Y);
        exit;
      end;
    end;
  end;
end;

// Обработка перемещения и столкновения блоков
procedure MainForm.MoveBlocks(direction: Directions);
begin
  var offset: integer;
  if      ((direction = Directions.Left)  or (direction = Directions.Up))   then offset := 2
  else if ((direction = Directions.Right) or (direction = Directions.Down)) then offset := 3
  else exit;
  
  while ( 
    (((direction = Directions.Left)  or (direction = Directions.Up))   and (offset <= 4))  or 
    (((direction = Directions.Right) or (direction = Directions.Down)) and (offset >= 1))) do begin
    foreach var movingBlock in Blocks do begin
      
      if ((((direction = Directions.Left) or (direction = Directions.Right)) and (movingBlock.x <> offset) )  or  
          (((direction = Directions.Up)   or (direction = Directions.Down))  and (movingBlock.y <> offset) )) then continue;
      
      var findedPoint := FindEndpoint(movingBlock, direction);
      if (not findedPoint.IsEmpty) then begin
        
        if ((findedPoint.X = movingBlock.x) and (findedPoint.Y = movingBlock.y)) then continue;
        
        foreach var block in Blocks do begin
          if ((block = movingBlock) or (block.isCollided)) then continue;
          
          if ((block.x = findedPoint.X) and (block.y = findedPoint.Y)) then begin
            collide(movingBlock, block, direction);
            MoveBlocks(direction);
          end;
        end;
        
        if (not movingBlock.isCollided) then begin
          movingBlock.x := findedPoint.X;
          movingBlock.y := findedPoint.Y;
          animationsStack.Add(new BlockMoveAnimation(movingBlock, movingBlock.x, movingBlock.y, blockMoveAnimationDuration));
        end;
      end;
    end;
    if      ((direction = Directions.Left)  or (direction = Directions.Up))   then offset += 1
    else if ((direction = Directions.Right) or (direction = Directions.Down)) then offset -= 1;
  end;
end;

// Соединение двух блоков при столкновении
procedure MainForm.collide(firstBlock, secondBlock: BlockClass; direction: Directions);
begin
  firstBlock.x := secondBlock.x;
  firstBlock.y := secondBlock.y;
  firstBlock.isCollided := true;
  secondBlock.isCollided := true;
  firstBlock.zIndex := 1;
  animationsStack.Add(new BlockMoveAnimation(firstBlock, firstBlock.x, firstBlock.y, blockMoveAnimationDuration));
  animationsStack.Add(new BlockCollideAnimation(firstBlock, secondBlock, blockMoveAnimationDuration));
  increaseScore(firstBlock.value * 2);
  Blocks := Blocks.OrderBy(block -> block.zIndex).ToList;
end;

// Обработка анимаций
procedure MainForm.MainGameTimer_Tick(sender: Object; e: EventArgs);
begin
  if (animationsStack.Count > 0) then begin
    var completedAnimations := new List<BlockAnimation>;
    
    foreach var animation in animationsStack do begin
      if (DateTime.Now.Subtract(animation.startTime).TotalMilliseconds < animation.duration) then begin
        
        var p := DateTime.Now.Subtract(animation.startTime).TotalMilliseconds / animation.duration;
        var x := AnimationsEasing.easeInOutSine(p);
        
        if (animation.animationType = AnimationTypes.moveAnimation) then begin
          animation.Block.Left := Round(animation.startLeft + (animation.targetLeft - animation.startLeft) * x);
          animation.Block.Top  := Round(animation.startTop  + (animation.targetTop  - animation.startTop)  * x);
        end
        else if (animation.animationType = AnimationTypes.opacityAnimation) then begin
          animation.Block.opacity := Round(animation.startOpacity + (animation.targetOpacity - animation.startOpacity) * x);
        end;
    
      end
      else begin
        completedAnimations.Add(animation);
        
        if      (animation.animationType = AnimationTypes.moveAnimation) then begin
          animation.Block.Left := animation.targetLeft;
          animation.Block.Top  := animation.targetTop;
        end
        else if (animation.animationType = AnimationTypes.collideAnimation) then begin
          Blocks.Remove(animation.Block);
          Blocks.Remove(animation.secondBlock);
          addBlock(animation.Block.x, animation.Block.y, animation.Block.value * 2, false);
        end
        else if (animation.animationType = AnimationTypes.opacityAnimation) then begin
          animation.Block.opacity := animation.targetOpacity;
        end;
      end;
    end;
    
    foreach var animation in completedAnimations do begin
      animationsStack.Remove(animation);
      
      if ((animation.animationType = AnimationTypes.moveAnimation) and (animationsStack.FindAll(animation -> animation.animationType = AnimationTypes.moveAnimation).Count = 0)) then begin
        addBlock2(true);
      end; 
    end;
    Draw;
  end;
end;

// Создание закруглённых прямоугольников
function GetRoundedRectangle(rect: Rectangle; d: integer):System.Drawing.Drawing2D.GraphicsPath;
begin
  var GraphPath := new System.Drawing.Drawing2D.GraphicsPath();
  
  GraphPath.AddArc(rect.X, rect.Y, d, d, 180, 90);
  GraphPath.AddArc(rect.X + rect.Width - d, rect.Y, d, d, 270, 90);
  GraphPath.AddArc(rect.X + rect.Width - d, rect.Y + rect.Height - d, d, d, 0, 90);
  GraphPath.AddArc(rect.X, rect.Y + rect.Height - d, d, d, 90, 90); 
  
  GraphPath.CloseFigure;
  
  result := GraphPath;
end;

// Отрисовка фона
procedure MainForm.DrawBackground();
begin
  var BlockColor := new SolidBrush(Color.FromArgb(204, 192, 180));
  
  backgroundGraphics.FillPath(new SolidBrush(Color.FromArgb(188, 173, 162)) ,GetRoundedRectangle(new Rectangle(0, 0, GameBackgroundPictureBox.Width, GameBackgroundPictureBox.Height), 10));
  
  for var y := 1 to ySize do 
  for var x := 1 to xSize do begin
    backgroundGraphics.FillPath(BlockColor, GetRoundedRectangle(new Rectangle(12 * x + 85 * (x-1), 12 * y + 85 * (y-1), 85, 85), 10));
  end;
end;

// Отрисовка блоков
procedure MainForm.Draw();
begin
  GameGraphics.Clear(Color.Transparent);
  
  foreach var block in blocks do begin
    var BlockRectangle := new Rectangle(block.Left, block.Top, block.Width, block.Height);
    GameGraphics.FillPath(new SolidBrush(Color.FromArgb(block.opacity, block.BlockColor)) ,GetRoundedRectangle(BlockRectangle, 10));
    BlockRectangle.Offset(new Point(2, 2));
    gameGraphics.DrawString(block.value.ToString, block.Font, new SolidBrush(Color.FromArgb(block.opacity, block.TextColor)), BlockRectangle, BlockStringFormat);
  end;
  
  GamePictureBox.Invalidate;
end;

// Управление счётом
procedure MainForm.setScore(newScore: integer);
begin
  Score := newScore;
  ScoreLabel.Text := Score.ToString;
  
  if (Score > BestScore) then begin
    BestScore := Score;
    BestScoreLabel.Text := BestScore.ToString;
  end;
end;

procedure MainForm.increaseScore(value: integer); 
begin
  setScore(Score + value);
end;

// Обработка жестов мышки
procedure MainForm.GamePictureBox_MouseDown(sender: Object; e: MouseEventArgs);
begin
  isMouseDown := true;
  x := e.X;
  y := e.Y;
end;

procedure MainForm.GamePictureBox_MouseMove(sender: Object; e: MouseEventArgs);
begin
  if (isMouseDown and (animationsStack.Count = 0) and (ResultLabel.Visible = false) and (DateTime.Now.Subtract(lastMoveTime).TotalMilliseconds > blockMoveAnimationDuration + blockOpacityAnimationDuration)) then begin
    isMouseDown := false;
    lastMoveTime := DateTime.Now;
    dX := e.X - x; 
    dY := e.Y - y;
    
    if (Abs(dX) > Abs(dY)) then begin
      if (dX > 0) then moveBlocks(Directions.Right)
      else moveBlocks(Directions.Left)
    end
    else begin
      if (dY > 0) then moveBlocks(Directions.Down)
      else moveBlocks(Directions.Up)
    end;
  end;
end;

procedure MainForm.GamePictureBox_MouseUp(sender: Object; e: MouseEventArgs);
begin
  isMouseDown := false;
end;

// Дальше скучно

procedure MainForm.ControlPanel_MouseDown(sender: Object; e: MouseEventArgs);
begin
  isWindowMoved := true;
  
  x := Left;
  y := Top;
  
  dX := System.Windows.Forms.Cursor.Position.X - x; 
  dY := System.Windows.Forms.Cursor.Position.Y - y;
end;

procedure MainForm.ControlPanel_MouseMove(sender: Object; e: MouseEventArgs);
begin
  if (isWindowMoved) then begin
    Left := System.Windows.Forms.Cursor.Position.X - dX;
    Top  := System.Windows.Forms.Cursor.Position.Y - dY;
  end;
end;

procedure MainForm.ControlPanel_MouseUp(sender: Object; e: MouseEventArgs);
begin
  isWindowMoved := false;
end;

var CloseButtonImage := Image.FromFile('assets/close-button.png');
var CloseButtonHoverImage := Image.FromFile('assets/close-button-hover.png');

procedure MainForm.CloseButton_MouseEnter(sender: Object; e: EventArgs);
begin
  CloseButton.BackgroundImage := CloseButtonHoverImage;
end;

procedure MainForm.CloseButton_MouseLeave(sender: Object; e: EventArgs);
begin
  CloseButton.BackgroundImage := CloseButtonImage;
end;

procedure MainForm.CloseButton_MouseClick(sender: Object; e: MouseEventArgs);
begin
  Close;
end;

var MinimizeButtonImage := Image.FromFile('assets/minimize-button.png');
var MinimizeButtonHoverImage := Image.FromFile('assets/minimize-button-hover.png');

procedure MainForm.MinimizeButton_MouseEnter(sender: Object; e: EventArgs);
begin
  MinimizeButton.BackgroundImage := MinimizeButtonHoverImage;
end;

procedure MainForm.MinimizeButton_MouseLeave(sender: Object; e: EventArgs);
begin
  MinimizeButton.BackgroundImage := MinimizeButtonImage;
end;

procedure MainForm.MinimizeButton_MouseClick(sender: Object; e: MouseEventArgs);
begin
  WindowState := FormWindowState.Minimized;
end;

procedure MainForm.ScoreBlock_Paint(sender: Object; e: PaintEventArgs);
begin
  ScoreBlock.BackColor := Color.Transparent;
  e.Graphics.SmoothingMode := System.Drawing.Drawing2D.SmoothingMode.HighQuality;
  e.Graphics.FillPath(new SolidBrush(Color.FromArgb(202, 185, 180)), GetRoundedRectangle(new Rectangle(0, 0, ScoreBlock.Width, ScoreBlock.Height), 8));
end;

procedure MainForm.BestScoreBlock_Paint(sender: Object; e: PaintEventArgs);
begin
  BestScoreBlock.BackColor := Color.Transparent;
  e.Graphics.SmoothingMode := System.Drawing.Drawing2D.SmoothingMode.HighQuality;
  e.Graphics.FillPath(new SolidBrush(Color.FromArgb(202, 185, 180)), GetRoundedRectangle(new Rectangle(0, 0, BestScoreBlock.Width, BestScoreBlock.Height), 8));
end;

procedure MainForm.NewGameButtonBlock_Paint(sender: Object; e: PaintEventArgs);
begin
  NewGameButtonBlock.BackColor := Color.Transparent;
  e.Graphics.SmoothingMode := System.Drawing.Drawing2D.SmoothingMode.HighQuality;
  e.Graphics.FillPath(new SolidBrush(Color.FromArgb(143, 123, 105)), GetRoundedRectangle(new Rectangle(0, 0, NewGameButtonBlock.Width, NewGameButtonBlock.Height), 8));
end;

end.

