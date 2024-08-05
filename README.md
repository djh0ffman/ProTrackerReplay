# ProTracker Replay Code
ProTracker Replay v2.3a

Essentially the original ProTracker replay but with a few fixes and some minor optimisations.

This is in no way a fast replay, if you're looking for CPU Cycles, check out LSP, P61 and PHX.

It is meant to be just an accurate replay which ensures all those weird edge cases are supported.

 1. DMA Wait
    Now uses a three stage CIA interrupt.
    Stage 1 - mt_music (standard replay code)
    Stage 2 - enable DMA for any new samples to be played
    Stage 3 - set sample loop pointers

 2. Volume clicks
    The original replay writes the volume register multiple
    times a tick. This has been moved to stage 2 CIA, when
    the DMA is enabled. Seemed to really clean up chip-tunes
    I tried out.

 3. Channel variables
    On each call to mt_init, the channel variables are cleared.
    This ensures effect commands and values used in the previous
    playing module do not persist.

 4. Minor optimisation
    If no finetune values are used, the period value comes straight
    from the pattern data saving a look-up on every bloody note!
