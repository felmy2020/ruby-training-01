class Brave
  attr_reader :name, :offense, :defense
  # セッターゲッターを一括定義
  attr_accessor :hp

  SPECIAL_ATTACK_CONSTANT = 1.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    puts "#{@name}の攻撃"

    # 0~3の間でランダムに数字が変わる
    attack_num = rand(4)

    if attack_num == 0
      # 必殺攻撃の表示
      puts "必殺攻撃"
      # calculate_special_attackの呼び出し
      # 攻撃力の1.5倍の数値が戻り値として返ってくる
      damage = calculate_special_attack - monster.defense
    else
      # 通常攻撃の表示
      puts "通常攻撃"
      damage = @offense - monster.defense
    end

    # putsは削除
    monster.hp -= damage
    # メッセージを追記
    puts "#{monster.name}は#{damage}のダメージを受けた"
    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

end

class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  # **paramsにすることでハッシュ形式の引数しか受け付けないようにできる
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(brave)

    puts "#{@name}の攻撃"

    # 勇者に与えるダメージの計算
    damage = @offense - brave.defense
    # 勇者クラスのHPにダメージを反映
    brave.hp -= damage

    puts "#{brave.name}は#{damage}のダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

end

# ハッシュ形式でデータを渡すのでどういうデータを渡しているのか把握しやすくなる
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)
brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

brave.attack(monster)
