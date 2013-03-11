# -*- coding: utf-8 -*-
module SilicaHeuristics

  module_function

  # 適当に決めた牌の点数。ほかで差が付かない時のための傾斜。
  def pai_point(pai, yakuhai, dora)
    ans = 1
    if pai.jihai? then
      ans += 1 if yakuhai.check(pai)
      ans += 5 * dora.count(pai)
    else
      ans += pai.num4
      ans += 3 if pai.red # 赤ドラ

      dora.each do |d|
        if pai.suit == d.suit then
          diff = (pai.num - d.num).abs
          ans += 3 if diff == 0 # ドラ # 足して5
          ans += 2 if diff <= 2 # ドラそば
        end
      end

    end
    ans
  end

end