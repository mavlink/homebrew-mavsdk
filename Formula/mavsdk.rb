class Mavsdk < Formula
  desc "API and library for MAVLink compatible systems written in C++11"
  homepage "https://mavsdk.mavlink.io"
  url "https://github.com/mavlink/MAVSDK.git",
    :tag => "v0.22.0",
    :revision => "164e5fe719608898b009364dbd870846d5163bfc"


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
