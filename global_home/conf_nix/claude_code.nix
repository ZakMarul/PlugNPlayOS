{ inputs, pkgs, config, ... }:
{
  programs.claude-code = {
    enable = true;
    package = inputs.claude-code.packages.${pkgs.stdenv.hostPlatform.system}.default;

    memory.source = ./claude/CLAUDE.md;

    settings = {
      model = "sonnet";

      permissions = {
        allow = [
          "Bash(git status)"
          "Bash(git diff *)"
          "Bash(git log *)"
        ];

        ask = [
          "WebFetch"
          "WebSearch"
        ];

        deny = [
          "Bash(sudo *)"
          "Read(**/.env)"
          "Read(**/.env.*)"
          "Read(**/secrets/**)"
          "Read(~/.ssh/**)"
          "Read(~/.gnupg/**)"
        ];

        blockReadsOutsideWorkingDirectories = true;
      };
    };
  };
}
