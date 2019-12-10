class Mavsdk < Formula
  desc "API and library for MAVLink compatible systems written in C++11"
  homepage "https://mavsdk.mavlink.io"
  url "https://github.com/mavlink/MAVSDK/archive/v0.22.0.zip"
  sha256 "64ea52ed312eb0f6c25142e65bc2a8faed11ede3babd54f7b86d392f2a72ea89"
  head "https://github.com/mavlink/MAVSDK.git"

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
