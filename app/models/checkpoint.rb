class Checkpoint
  include Singleton

  @@checkpoints =  ["London, England", 
                    "Prague, Czech Republic",
                    "Istanbul, Turkey", 
                    "Tehran, Iran",
                    "Ashgabat, Asgabat, Turkmenistan",
                    "Bukhara, Bukhara Province, Uzbekistan", 
                    "Osh, Osh Province, Kyrgyzstan",
                    "Almaty City, Kazakhstan",
                    "Semey, East Kazakhstan, Kazakhstan",
                    "Ulaanabatar, Mongolia" ]
  def self.all
    @@checkpoints
  end

  def self.first
    @@checkpoints.first
  end

  def self.last
    @@checkpoints.last
  end
end
