set -e

./Pods/Sourcery/bin/sourcery --sources WeatherApp  --templates Pods/Sourcery/Templates/AutoMockable.stencil --templates Pods/Sourcery/Templates/AutoEquatable.stencil --output WeatherAppTests/Generated

sed -i '' '1s/^/@testable import WeatherApp\
/g' WeatherAppTests/Generated/AutoMockable.generated.swift

sed -i '' '1s/^/@testable import WeatherApp\
/g' WeatherAppTests/Generated/AutoEquatable.generated.swift
