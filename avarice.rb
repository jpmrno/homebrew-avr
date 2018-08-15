class Avarice < Formula
  desc "Interfaces the GNU GDB with the AVR JTAG ICE from Atmel"
  homepage "https://avarice.sourceforge.io/"
  head "https://svn.code.sf.net/p/avarice/code/trunk"

  depends_on "binutils"
  depends_on "hidapi"
  depends_on "automake"

  def install
    args = [
      "--disable-debug",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--disable-nls",
      "--prefix=#{prefix}",
    ]

    system "./Bootstrap"

    mkdir "build" do
      system "../configure", *args
      system "make"
      system "make", "install"
    end
  end
  
  test do
    system "#{bin}/avarice", "--version"
  end
end
