source $DIRNAME/../functions/_pure_prompt.fish
source $DIRNAME/../functions/_pure_prompt_virtualenv.fish
source $DIRNAME/../functions/_pure_prompt_vimode.fish
source $DIRNAME/../functions/_pure_prompt_symbol.fish
source $DIRNAME/../functions/_pure_print_prompt.fish

set --local failed 1
set --local succeed 0

test "print prompt after succeeding command"
    (
        set pure_color_green (set_color green)
        set pure_symbol_prompt '>'  # using default ❯ break following tests
        set --local last_command $succeed

        _pure_prompt $last_command
    ) = (set_color green)'>'
end

test "print prompt after failing command"
    (
        set pure_color_red (set_color red)
        set pure_symbol_prompt '>'  # using default ❯ break following tests
        set --local last_command $failed

        _pure_prompt $last_command
    ) = (set_color red)'>'
end
