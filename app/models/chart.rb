class Chart < ActiveRecord::Base

  def self.refresh
    Domain.delete_all

    Datapoint.all.map(&:domain).uniq.each { |name|
      Domain.from_data(name)
    }
    (0..1000).step(50).map { |a|
      Chart.create(min: a, max: a+gap,
                   count: Domain.where("median > ? AND median < ?", a, a+gap).count)
    }
  end

  private

  def self.gap
    50
  end
end
