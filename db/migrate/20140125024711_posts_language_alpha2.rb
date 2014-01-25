class PostsLanguageAlpha2 < ActiveRecord::Migration
  def up
    ISO_639::ISO_639_1.each do |ary|
      alpha3 = ary[0]
      alpha2 = ary[2]
      exec_update(%Q[update posts set language = "#{alpha2}" where language = "#{alpha3}"])
    end
  end

  def down
    ISO_639::ISO_639_1.each do |ary|
      alpha3 = ary[0]
      alpha2 = ary[2]
      exec_update(%Q[update posts set language = "#{alpha3}" where language = "#{alpha2}"])
    end
  end
end
