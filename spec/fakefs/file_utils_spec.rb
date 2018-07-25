RSpec.describe FakeFS::FileUtils do
  describe '#cp' do
    context 'when copying to destination dir that does not exist #421' do
      before do
        FakeFS.activate!
        FileUtils.mkdir_p(dir)
        FileUtils.touch(source_file)
      end

      after do
        FakeFS.deactivate!
      end

      let(:dir) { '/tmp/test1' }
      let(:source_file) { "#{dir}/file.txt" }
      let(:dest_file) { "#{dir}/not_existing/file.txt" }

      specify do
        expect {
          FileUtils.cp(source_file, dest_file)
        }.to raise_error('foo')

        # puts ret.inspect
          # .to raise_error
        # (
        #   Errno::ENOENT, "No such file or directory @ rb_sysopen - /tmp/unexisting/file123.txt"
        # )
      end
    end
  end
end
