require './services/json_search'

describe ::JsonSearch do
  describe 'possible searches' do
    let(:service) { described_class.new(search_string) }

    context 'search with only name surname' do
      let(:search_string) { 'Common Lisp' }
      it 'search Common Lisp' do
        expect(service.process).to eq([{
          'Name' => 'Common Lisp',
          'Type' => 'Compiled, Interactive mode, Object-oriented class-based, Reflective',
          'Designed by' => 'Scott Fahlman, Richard P. Gabriel, Dave Moon, Guy Steele, Dan Weinreb'
        }])
      end
    end

    context 'search with values in quotes' do
      let(:search_string) { 'Interpreted "Thomas Eugene"' }
      it 'search Interpreted "Thomas Eugene"' do
        expect(service.process).to eq([{
          'Name' => 'BASIC',
          'Type' => 'Imperative, Compiled, Procedural, Interactive mode, Interpreted',
          'Designed by' => 'John George Kemeny, Thomas Eugene Kurtz'
        }])
      end
    end

    context 'search with values from different columns' do
      let(:search_string) { 'Scripting Microsoft' }
      it 'search Scripting Microsoft' do
        expect(service.process).to eq([{
            'Name' => 'JScript',
            'Type' => 'Curly-bracket, Procedural, Reflective, Scripting',
            'Designed by' => 'Microsoft'
          },
           {
             'Name' => 'VBScript',
             'Type' => 'Interpreted, Procedural, Scripting, Object-oriented class-based',
             'Designed by' => 'Microsoft'
           },
           {
             'Name' => 'Windows PowerShell',
             'Type' => 'Command line interface, Curly-bracket, Interactive mode, Interpreted, Scripting',
             'Designed by' => 'Microsoft'
         }])
      end
    end

    context 'search with filter' do
      let(:search_string) { 'John --Array' }
      it 'search John --Array' do
        expect(service.process).to eq([{
            'Name' => 'BASIC',
            'Type' => 'Imperative, Compiled, Procedural, Interactive mode, Interpreted',
            'Designed by' => "John George Kemeny, Thomas Eugene Kurtz"
          },
          {
            'Name' => 'Haskell',
            'Type' => 'Compiled, Functional, Metaprogramming, Interpreted, Interactive mode',
            'Designed by' => 'Simon Peyton Jones, Lennart Augustsson, Dave Barton, Brian Boutel, Warren Burton, Joseph Fasel, Kevin Hammond, Ralf Hinze, Paul Hudak, John Hughes, Thomas Johnsson, Mark Jones, John Launchbury, Erik Meijer, John Peterson, Alastair Reid, Colin Runciman, Philip Wadler'
          },
          {
            'Name' => 'Lisp',
            'Type' => 'Metaprogramming, Reflective',
            'Designed by' => 'John McCarthy' },
          {
            'Name' => 'S-Lang',
            'Type' => 'Curly-bracket, Interpreted, Procedural, Scripting, Interactive mode',
            'Designed by' => 'John E. Davis'
        }])
      end
    end

    context 'search with filter' do
      let(:search_string) { 'Arthur --K' }
      it 'search Arthur --K' do
        expect(service.process).to eq([{
          "Name"=>"A+",
          "Type"=>"Array",
          "Designed by"=>"Arthur Whitney"
        }])
      end
    end
  end
end
