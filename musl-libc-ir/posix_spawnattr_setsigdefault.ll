; ModuleID = 'src/process/posix_spawnattr_setsigdefault.c'
source_filename = "src/process/posix_spawnattr_setsigdefault.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawnattr_t = type { i32, i32, %struct.__sigset_t, %struct.__sigset_t, i32, i32, i8*, [56 x i8] }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define i32 @posix_spawnattr_setsigdefault(%struct.posix_spawnattr_t* noalias nocapture noundef writeonly %0, %struct.__sigset_t* noalias nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.posix_spawnattr_t, %struct.posix_spawnattr_t* %0, i64 0, i32 2
  %4 = bitcast %struct.__sigset_t* %3 to i8*
  %5 = bitcast %struct.__sigset_t* %1 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %4, i8* noundef nonnull align 8 dereferenceable(128) %5, i64 128, i1 false) #2, !tbaa.struct !3
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 128, !4}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
