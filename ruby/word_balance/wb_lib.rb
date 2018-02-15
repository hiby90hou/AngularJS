def balance word
  scores = word.downcase.split('').map { |letter| get_score(letter) }
  scores.each_index do |bal_point_idx|
    weights = calc_weights(scores, bal_point_idx)
    return weights if weights[:balanced]
  end
  return {balanced: false}
end

def get_score letter
  alphabet.index(letter) + 1
end

def alphabet
  @alphabet ||= ('a'..'z').to_a
end

def calc_weights scores, bal_point_idx
  weights = scores.each_with_index.map do |letter_score, idx|
    letter_score * (idx - bal_point_idx)
  end
  return {
    balanced: weights.sum == 0,
    per_side: weights[0...bal_point_idx].sum.abs,
    idx: bal_point_idx
  }
end

def display_success bal_point, word
  word[bal_point[:idx]] = " #{word[bal_point[:idx]]} "
  puts "#{word.upcase} - #{bal_point[:per_side]}"
end

def display_fail word
  puts "#{word} does not balance".upcase
end
