class Domain < ActiveRecord::Base

  def self.from_data(name)
    dps = Datapoint.where(domain: name)
    min = dps.minimum(:responsetime)
    avg = dps.average(:responsetime)
    max = dps.maximum(:responsetime)
    med = median(dps.map(&:responsetime))

    fw = dps.last.framework
    server = dps.last.server

    Domain.create(name: name, min: min, max: max, avg: avg, median: med, framework: fw, server: server)
  end

private
  def self.median(array)
    sorted = array.sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
end
