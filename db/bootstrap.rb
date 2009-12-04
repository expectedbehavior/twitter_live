Bootstrapper.for :development do |b|
end

Bootstrapper.for :culerity_continuousintegration do |b|
end

Bootstrapper.for :culerity_development do |b|
end

Bootstrapper.for :production do |b|
end

Bootstrapper.for :test do |b|
  b.truncate_tables :all
end

Bootstrapper.for :cucumber do |b|
end

