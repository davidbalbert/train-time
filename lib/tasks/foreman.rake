desc "Generate default .env file"
task ".env" do
  File.unlink(".env")
  File.open(".env", "w") do |f|
    f.puts <<ENVFILE
RACK_ENV=development
RAILS_ENV=development

DATABASE_URL=postgres://localhost/traintime
ENVFILE
  end
end
