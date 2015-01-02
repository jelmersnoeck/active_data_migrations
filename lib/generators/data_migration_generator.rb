class DataMigrationGenerator < Rails::Generators::Base
  argument :name, :type => :string
  argument :path, :type => :string, :default => "/db/data"

  def create_data_migration_file
    create_file "#{directory}/#{filename}", "#{file_contents}"
  end

  private
  def directory
    "#{Rails.root}/#{path}"
  end

  def filename
    "#{Time.now.strftime('%Y%m%d%H%M%S')}_#{name.underscore}.rb"
  end

  def file_contents
    "class #{name.camelcase} < ActiveRecord::Migration
  def up
  end
end"
  end
end
