namespace :adresni_posta do
  desc 'Loads all "adresni_posta" to DB'

  desc 'Create DB schema'
  task :create_schema do
    require 'ruian_model'
    schema = File.join(RuianModel.root, 'db/adresni_posta_schema.sql')
    sh "psql -d ruian < \"#{schema}\""
  end

  desc 'Download list of "AdresniPosta" and store in CSV file'
  task :download do
    sh 'vendor/adresni_posta/download_ap.sh'
  end

  desc 'Write CSV file of "AdresniPosta" to DB table'
  task :load do |t, args|
    require 'ruian_model'
    require 'csv'
    RuianModel.setup
    CSV.open(
      File.join(
        RuianModel.root,
        'vendor/adresni_posta/UI_ADRESNI_POSTA.utf8.csv'
      ),
      col_sep: ';',
      headers: true
    ).each do |row|
      psc = Integer(row['PSC'].gsub(/\s+/, ''))
      plati_od = DateTime.parse(row['PLATI_OD']) if row['PLATI_OD']
      plati_do = DateTime.parse(row['PLATI_DO']) if row['PLATI_DO']
      AdresniPosta.find_or_create_by!(nazev: row['NAZEV']) do |am|
        am.psc = psc
        am.plati_do = plati_od
        am.plati_od = plati_do
        puts "Saving: #{am.inspect}"
      end
    end
  end
end
