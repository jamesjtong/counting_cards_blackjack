class TrueCount
  PLUS_COUNT = %w(2 3 4 5 6) 
  NEUTRAL_COUNT = %w(7 8 9)
  MINUS_COUNT = %w(10 J Q K A)
  ACE_COUNT = %w(A)
  
  def true_count_n_pop
    card = self.pop
    if ACE_COUNT.include?(card)
      @ace_count += 1
    end

    if PLUS_COUNT.include?(card)
      @true_count += 1
    elsif MINUS_COUNT.include?(card)
      @true_count -= 1
    end
  end

end
