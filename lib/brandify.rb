class Brandify
  FOOD = %w( Foodie Burger Whiskey Kale Beer IPA Shrimp Burrito Sushi Watermelon Breastmilk Cabbage )
  SELF = %w( Mother Father Sister Brother Son Daughter Step-cousin Veteran Married Aunt Uncle )
  POLITICS = %w( Democrat Republican Conservative Gun 2A Liberal GOP Feminist Marxist Fascist )
  TECH = [ "Web dev", "Ruby", "Dev ops", "IT", "Apple", "Engineer", "Javascript", "Tech" ]
  BRANDING = [ "Marketing", "Inbound", "Brand", "Synergy", "Leverage", "Catalyst", "Thought leader" ]
  HOBBIES = %w( Anime Steampunk Dog Cat Film TV Music )
  BAD = %w( Hitler Mao Stalin Pinochet Thatcher Piss Xanax Hell Prison )
  THINGS = FOOD + SELF + POLITICS + TECH + BRANDING + HOBBIES + BAD

  MODIFIERS = %w(
              dude man bro dad girl chick lady mom
              fan addict snob maniac junkie nerd geek dork
              liker lover enjoyer respecter disliker hater
              writer blogger journalist crier wonk enthusiast
              )

  LOCATIONS = %w( NYC SF LA Boston Philly London Paris Hell )
  EMOJIS = %w( :plane: :toilet: :fire: :100: )

  def self.bio
    things = THINGS.sample(10)
    modifiers = choose_some_modifiers
    things_to_modify = things.sample(modifiers.size)
    left_alone = things - things_to_modify
    modified_things = modify_some_things(things_to_modify, modifiers)
    full_array = (left_alone + modified_things).shuffle
    # At most we'll add 10 hashtags so we need a bio of 150 or less to stay under 160
    full_array = ensure_valid_length(full_array, 150)
    join_results(add_hashtags(full_array))
  end

  def self.location
    locations = LOCATIONS.sample(3)
    emojis = EMOJIS.sample(2)
    full_array = locations.first(2).zip(emojis) << locations.last
    full_array.flatten!
    full_array = ensure_valid_length(full_array, 30)
    full_array.join(" ")
  end

  private

  def self.choose_some_modifiers
    10.times.map { MODIFIERS.sample if 1 + rand(10) > 7 }.compact
  end

  def self.modify_some_things(things, modifiers)
    things.zip(modifiers).map { |pair| pair.join(" ") }
  end

  def self.add_hashtags(array)
    array.map! { |i| 1 + rand(10) > 8 ? "##{i}" : i }
  end

  def self.ensure_valid_length(array, length_cap)
    array.pop while join_results(array).length > length_cap
    array
  end

  def self.join_results(array)
    array.join(". ") + "."
  end

end
