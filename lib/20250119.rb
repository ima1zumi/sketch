# MEMO: p5.rbだと描画が遅い
# rbCanvasでの実行推奨

def setup
  createCanvas(400, 600)
end

def draw
  background("#CE332E")
  grid_size = 100

  strokeWeight(5)

  # 月
  fill("#FFFFFF")
  ellipse(170, 170, 280, 280)

  # 山
  fill("#333333")
  ellipse(150, 730, 750, 750)

  # 芒
  stroke("#000000")

  t = frameCount * 0.01
  sway = noise(t) * 90

  strokeWeight(1)

  (0...8).each do |l|
    (0...20).each do |k|
      # fill(色相=52, 彩度=80, 明度=4 + l*12)
      fill(0, 0, 0 + l * 12)

      # 1本の草を構成するループ
      (0...180).each do |i|
        x = k * 24 + l * 3 - i
        y = (600 + l * 20) - (2.5 + noise(k, l)) * i + i * i / (sway + 90 * noise(2, k, l))
        # 円の直径(r)
        r = (2 + 4 * noise(1, k, l)) * (1 - i / 128.0)

        circle(x, y, r)
      end
    end
  end

  # 枠線
  noFill
  stroke("#000000")
  strokeWeight(15)
  rect(5,5,390,590)
end
