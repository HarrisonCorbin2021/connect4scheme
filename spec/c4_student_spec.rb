#
# Harrison Corbin
#
require 'spec_helper'

describe 'C4 standard board size' do
    it 'detects P1 winning horizontally in row 0' do
        # Notice that the game should end before the last 'q' input is consumed
        result = test_c4('aabbccd')
        expect(result).to declare_win_for 1
    end

    it 'quits before declaring a winner in column 0' do
        result = test_c4('abababq')
        expect(result).to be_abandoned
    end
end

describe 'C4 standard board size' do
    it 'detects P1 winning horizontally at the edge' do
        result = test_c4('bddeeffg')
        expect(result).to declare_win_for 2
    end
end

describe 'Connect 4 alternate' do
    it 'detects player 2 winning horizontally on a big board' do
        result = test_c4('abbccdde', 3, 9, 7)
        expect(result).to declare_win_for 2
    end

    it 'quits before declaring p2 a winner horizontally' do
        result = test_c4('abbccddq', 3, 9, 7)
        expect(result).to be_abandoned
    end
end

describe 'Connect 4 alternate' do
    it 'detects player 1 winning vertically on a big board' do
        result = test_c4('abacada', 3, 9, 7)
        expect(result).to declare_win_for 1
    end

    it 'quits before declaring p1 a winner vertically' do
        result = test_c4('abacadq', 3, 9, 7)
        expect(result).to be_abandoned
    end
end

describe 'Connect 4 alternate' do
    it 'detects player 2 winning vertically on a big board' do
        result = test_c4('abcbcbcb', 3, 9, 7)
        expect(result).to declare_win_for 2
    end

    it 'quits before declaring p2 a winner vertically' do
        result = test_c4('abcbcbcq', 3, 9, 7)
        expect(result).to be_abandoned
    end
end

describe 'Connect 4 alternate' do
    it 'detects player 1 winning diagonally on a big board' do
        result = test_c4('abbccdedcdd', 3, 9, 7)
        expect(result).to declare_win_for 1
    end

    it 'quits before declaring p1 a winner diagonally' do
        result = test_c4('abbccdedcdq', 3, 9, 7)
        expect(result).to be_abandoned
    end
end

describe 'Connect 4 alternate' do
    it 'detects player 2 winning diagonally on a big board' do
        result = test_c4('abccbdddeeee', 3, 9, 7)
        expect(result).to declare_win_for 2
    end

    it 'quits before declaring p2 a winner diagonally' do
        result = test_c4('abccbdddeeeq', 3, 9, 7)
        expect(result).to be_abandoned
    end
end

describe 'Connect 4 alternate' do
    xit 'detects a tie' do
        result = test_c4('aabbccaabbccaabbccedfegfdggdfgefdegdfgefde', 3, 9, 7)
    end

    xit 'quits before declaring a winner tie' do
        result = test_c4('aabbccaabbccaabbccedfegfdggdfgefdegdfgefdq', 3, 9, 7)
        expect(result).to be_abandoned
    end
end
