ABBConfig.all.each do |cfg|
  puts "#{cfg.var}=#{cfg.value}"
  ABBConfig.send("#{cfg.var}=",cfg.value)
end
ABBConfig.save_default(:data_key,'SNN')
ABBConfig.save_default(:mct, 90)
ABBConfig.save_default(:maxct, 1560)
ABBConfig.save_default(:maxmaxct, 2880)
