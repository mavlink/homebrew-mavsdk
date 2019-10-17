class Mavsdk < Formula
  desc "API and library for MAVLink compatible systems written in C++11"
  homepage "https://mavsdk.mavlink.io"
  url "https://github.com/daniel-bryant/MAVSDK/releases/download/v0.20.0/v0.20.0.tar.gz"
  sha256 "e07b41a900844a448ec589ceb59ebdbc18a9436a1ee3db044b1df3becaf97bdb"

  depends_on "cmake" => :build

  def install
    system "cmake", "-Bbuild/default",
                    "-DBUILD_BACKEND=ON",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX=#{prefix}",
                    "-H."
    system "cmake", "--build", "build/default", "--target", "install"
  end

  test do
    assert_equal "Usage: backend_bin [-h | --help]",
                 shell_output("#{bin}/mavsdk_server --help").split("\n").first
  end
end
