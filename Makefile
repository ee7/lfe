ERL    := $(shell which erl)
REBAR3 := $(shell which rebar3)
LFE     = ./_build/default/lib/lfe/bin/lfe

ifeq ($(ERL),)
  $(error Can't find Erlang executable 'erl')
else ifeq ($(REBAR3),)
  $(error Can't find rebar3)
endif

compile: ; $(REBAR3) compile

clean: ; $(REBAR3) clean

.PHONY: test
test: compile; $(LFE) ./bin/check-exercises.lfe
