LINUX_PLUGINS="\
    linux.bash.Bash linux.boottime.Boottime linux.capabilities.Capabilities \
    linux.capabilities.CapabilitiesData linux.capabilities.TaskData linux.check_afinfo.Check_afinfo \
    linux.check_creds.Check_creds linux.check_idt.Check_idt linux.check_modules.Check_modules \
    linux.check_syscall.Check_syscall linux.ebpf.EBPF linux.elfs.Elfs linux.envars.Envars \
    linux.hidden_modules.Hidden_modules linux.iomem.IOMem linux.ip.Addr linux.ip.Link \
    linux.kallsyms.Kallsyms linux.keyboard_notifiers.Keyboard_notifiers linux.kmsg.ABCKmsg \
    linux.kmsg.DescStateEnum linux.kmsg.Kmsg linux.kmsg.Kmsg_3_11_to_5_10 linux.kmsg.Kmsg_3_5_to_3_11 \
    linux.kmsg.Kmsg_5_10_to_ linux.kmsg.Kmsg_pre_3_5 linux.kthreads.Kthreads linux.library_list.LibraryList \
    linux.lsmod.Lsmod linux.lsof.FDInternal linux.lsof.FDUser linux.lsof.Lsof linux.malfind.Malfind \
    linux.module_extract.ModuleExtract linux.modxview.Modxview linux.mountinfo.MountInfo \
    linux.mountinfo.MountInfoData linux.netfilter.Netfilter linux.pagecache.Files \
    linux.pagecache.InodeInternal linux.pagecache.InodePages linux.pagecache.InodeUser \
    linux.pagecache.RecoverFs linux.pidhashtable.PIDHashTable linux.proc.Maps linux.psaux.PsAux \
    linux.pscallstack.PsCallStack linux.pscallstack.StackEntry linux.pslist.PsList \
    linux.pslist.TaskFields linux.psscan.DescExitStateEnum linux.psscan.PsScan linux.pstree.PsTree \
    linux.ptrace.Ptrace linux.sockstat.SockHandlers linux.sockstat.Sockstat linux.tty_check.tty_check \
    linux.vmaregexscan.VmaRegExScan linux.vmayarascan.VmaYaraScan linux.vmcoreinfo.VMCoreInfo\
"
MAC_PLUGINS="\
    mac.bash.Bash mac.check_syscall.Check_syscall mac.check_sysctl.Check_sysctl \
    mac.check_trap_table.Check_trap_table mac.dmesg.Dmesg mac.ifconfig.Ifconfig \
    mac.kauth_listeners.Kauth_listeners mac.kauth_scopes.Kauth_scopes mac.kevents.Kevents \
    mac.list_files.List_Files mac.lsmod.Lsmod mac.lsof.Lsof mac.malfind.Malfind \
    mac.mount.Mount mac.netstat.Netstat mac.proc_maps.Maps mac.psaux.Psaux \
    mac.pslist.PsList mac.pstree.PsTree mac.socket_filters.Socket_filters \
    mac.timers.Timers mac.trustedbsd.Trustedbsd mac.vfsevents.VFSevents\
"

WINDOWS_PLUGINS="\
    windows.amcache.Amcache windows.bigpools.BigPools windows.cachedump.Cachedump \
    windows.callbacks.Callbacks windows.cmdline.CmdLine windows.cmdscan.CmdScan \
    windows.consoles.Consoles windows.crashinfo.Crashinfo windows.debugregisters.DebugRegisters \
    windows.deskscan.DeskScan windows.desktops.Desktops windows.devicetree.DeviceTree \
    windows.direct_system_calls.DirectSystemCalls windows.direct_system_calls.syscall_finder_type \
    windows.dlllist.DllList windows.driverirp.DriverIrp windows.drivermodule.DriverModule \
    windows.driverscan.DriverScan windows.dumpfiles.DumpFiles windows.envars.Envars \
    windows.etwpatch.EtwPatch windows.filescan.FileScan windows.getservicesids.GetServiceSIDs \
    windows.getservicesids.createservicesid windows.getsids.GetSIDs windows.getsids.find_sid_re \
    windows.handles.Handles windows.hashdump.Hashdump windows.hollowprocesses.HollowProcesses \
    windows.iat.IAT windows.indirect_system_calls.IndirectSystemCalls windows.info.Info \
    windows.joblinks.JobLinks windows.kpcrs.KPCRs windows.ldrmodules.LdrModules \
    windows.lsadump.Lsadump windows.malfind.Malfind windows.mbrscan.MBRScan windows.memmap.Memmap \
    windows.mftscan.ADS windows.mftscan.MFTScan windows.mftscan.ResidentData windows.modscan.ModScan \
    windows.modules.Modules windows.mutantscan.MutantScan windows.netscan.NetScan \
    windows.netstat.NetStat windows.orphan_kernel_threads.Threads \
    windows.pe_symbols.ExportSymbolFinder windows.pe_symbols.PDBSymbolFinder \
    windows.pe_symbols.PESymbolFinder windows.pe_symbols.PESymbols \
    windows.pedump.PEDump windows.poolscanner.PoolConstraint windows.poolscanner.PoolHeaderScanner \
    windows.poolscanner.PoolScanner windows.poolscanner.PoolType windows.privileges.Privs \
    windows.processghosting.ProcessGhosting windows.pslist.PsList windows.psscan.PsScan \
    windows.pstree.PsTree windows.psxview.PsXView windows.scheduled_tasks.ScheduledTasks \
    windows.sessions.Sessions windows.shimcachemem.ShimcacheMem windows.skeleton_key_check.Skeleton_Key_Check \
    windows.ssdt.SSDT windows.strings.Strings windows.suspended_threads.SuspendedThreads \
    windows.suspicious_threads.SuspiciousThreads windows.svcdiff.SvcDiff windows.svclist.SvcList \
    windows.svcscan.ServiceBinaryInfo windows.svcscan.SvcScan windows.symlinkscan.SymlinkScan \
    windows.thrdscan.ThrdScan windows.threads.Threads windows.timers.Timers windows.truecrypt.Passphrase \
    windows.unhooked_system_calls.unhooked_system_calls windows.unloadedmodules.UnloadedModules \
    windows.vadinfo.VadInfo windows.vadregexscan.VadRegExScan windows.vadwalk.VadWalk \
    windows.vadyarascan.VadYaraScan windows.verinfo.VerInfo windows.virtmap.VirtMap \
    windows.windows.Windows windows.windowstations.WindowStations\
"

MISC_PLUGINS="\
    banners.Banners configwriter.ConfigWriter frameworkinfo.FrameworkInfo isfinfo.IsfInfo \
    layerwriter.LayerWriter regexscan.RegExScan timeliner.TimeLinerInterface timeliner.TimeLinerType \
    timeliner.Timeliner vmscan.PageStartScanner vmscan.VMCSTest vmscan.Vmscan yarascan.YaraScan \
    yarascan.YaraScanner\
"

vol-export() {
    local memdump=$1
    local list=$2
    local dry_run=$3
    for plugin in $list; do
        FILENAME=$(echo $plugin | tr '.' '-' | xargs -I {} echo {}.log)
        if [ -f $FILENAME ]; then
            echo "$FILENAME already exists, skipping..."
            continue
        fi
        echo "Running plugin: $plugin"

        if [ "$dry_run" -eq 1 ]; then
            echo "Dry run mode, skipping execution."
            continue
        else
            RESULT=$(vol -f "${memdump}" $plugin)
            echo "Saving to $FILENAME"
            echo "$RESULT" > $FILENAME
        fi
    done
}

usage() {
    echo "Usage: $0 -f <memdump> [-m <os-mode>] [-d] [-n] [-h]"
    echo "options:"
    echo "  -h                   Show this help message"
    echo "  -f <memdump_file>   Path to the memory dump file"
    echo "  -m <os_mode>        OS mode (e.g., windows, linux, mac)"
    echo "  -d                   Dry run mode (do not execute plugins)"
    echo ""
    echo "when <os_mode> is not specified, misc plugins will be run"
    exit 1
}

MEMDUMP=""
OS_MODE=""
DRY_RUN=0
while getopts "f:m:dn" opt; do
    case $opt in
        f) MEMDUMP="$OPTARG" ;;
        m) OS_MODE="$OPTARG" ;;
        d) DRY_RUN=1 ;;
        h) usage ;;
        *) usage ;;
    esac
done

if [ -z "$MEMDUMP" ]; then
    echo "Error: Memory dump file is required."
    usage
fi

if [ ! -f "$MEMDUMP" ]; then
    echo "Error: Memory dump file '$MEMDUMP' does not exist."
    exit 1
fi

if [ -z "$OS_MODE" ]; then
    echo "No OS mode specified, running misc plugins..."
    vol-export "$MEMDUMP" "${MISC_PLUGINS}" "$DRY_RUN"
else
    case $OS_MODE in
        linux)
            echo "Running Linux plugins..."
            vol-export "$MEMDUMP" "${LINUX_PLUGINS}" "$DRY_RUN"
            ;;
        mac)
            echo "Running Mac plugins..."
            vol-export "$MEMDUMP" "${MAC_PLUGINS}" "$DRY_RUN"
            ;;
        windows)
            echo "Running Windows plugins..."
            vol-export "$MEMDUMP" "${WINDOWS_PLUGINS}" "$DRY_RUN"
            ;;
        *)
            echo "Error: Unsupported OS mode '$OS_MODE'. Supported modes are: linux, mac, windows."
            exit 1
            ;;
    esac
fi