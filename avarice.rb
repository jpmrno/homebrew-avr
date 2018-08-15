class Avarice < Formula
  desc "Interfaces the GNU GDB with the AVR JTAG ICE from Atmel"
  homepage "https://avarice.sourceforge.io/"
  url "https://downloads.sourceforge.net/avarice/avarice-2.13.tar.bz2"
  sha256 "a14738fe78e1a0a9321abcca7e685a00ce3ced207622ccbcd881ac32030c104a"
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

    system "./Bootstrap" if File.file? "./Bootstrap"

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
