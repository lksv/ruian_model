require 'active_support/inflector'

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.uncountable %w( ulice momc katastralni_uzemi momc )
  inflect.irregular 'adresni_misto', 'adresni_mista'
  inflect.irregular 'stavebni_objekt', 'stavebni_objekty'
  inflect.irregular 'cislo_domu', 'cisla_domu'
  inflect.irregular 'obec', 'obce'
  inflect.irregular 'parcela', 'parcely'
  inflect.irregular 'cast_obce', 'casti_obci'
  inflect.irregular 'okres', 'okresy'
  inflect.irregular 'kraj', 'kraje'
end
