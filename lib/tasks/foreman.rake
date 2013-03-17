desc "Generate default .env file"
task ".env" do
  print "MTA API key: "
  key = $stdin.gets.chomp

  File.unlink(".env") if File.exists?(".env")

  File.open(".env", "w") do |f|
    f.puts <<ENVFILE
RACK_ENV=development
RAILS_ENV=development

DATABASE_URL=postgres://localhost/traintime

MTA_API_KEY=#{key}
ENVFILE
  end
end
