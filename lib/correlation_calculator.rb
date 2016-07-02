class CorrelationCalculator
  attr_accessor :compared_events, :all_event_names

  def initialize(name)
    self.compared_events = Event.where(name: name)
    self.all_event_names =
      Event.distinct.where.not(name: name).pluck(:name)
  end

  def calculate
    self.all_event_names.map do |name|
      calculate_correlation(name)
    end
  end

  def calculate_correlation(name)
    events = Event.where name: name

    set_a, set_b = [], []

    events.each do |e|
      relative_events = compared_events.relative_to(e)
      relative_value =
        relative_events.sum(&:value) / relative_events.size

      set_a << e.value
      set_b << relative_value
    end

    correlation_coefficient(set_a, set_b)
  end

  # Shamelessly copy/pasted from the internet
  def correlation_coefficient(x,y)
    n=x.length

    sumx=x.inject(0) {|r,i| r + i}
    sumy=y.inject(0) {|r,i| r + i}

    sumxSq=x.inject(0) {|r,i| r + i**2}
    sumySq=y.inject(0) {|r,i| r + i**2}

    prods=[]; x.each_with_index{|this_x,i| prods << this_x*y[i]}
    pSum=prods.inject(0){|r,i| r + i}

    # Calculate Pearson score
    num=pSum-(sumx*sumy/n)
    den=((sumxSq-(sumx**2)/n)*(sumySq-(sumy**2)/n))**0.5
    if den==0
      return 0
    end
    r=num/den
    return r
  end
end
