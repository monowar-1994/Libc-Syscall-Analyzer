; ModuleID = 'src/process/posix_spawnp.c'
source_filename = "src/process/posix_spawnp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.posix_spawn_file_actions_t = type { [2 x i32], i8*, [16 x i32] }
%struct.posix_spawnattr_t = type { i32, i32, %struct.__sigset_t, %struct.__sigset_t, i32, i32, i8*, [56 x i8] }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @posix_spawnp(i32* noalias noundef %0, i8* noalias noundef %1, %struct.posix_spawn_file_actions_t* noundef %2, %struct.posix_spawnattr_t* noalias noundef readonly %3, i8** noalias noundef %4, i8** noalias noundef %5) local_unnamed_addr #0 {
  %7 = alloca %struct.posix_spawnattr_t, align 8
  %8 = bitcast %struct.posix_spawnattr_t* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 336, i8* nonnull %8) #5
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(336) %8, i8 0, i64 336, i1 false) #6
  %9 = icmp eq %struct.posix_spawnattr_t* %3, null
  br i1 %9, label %12, label %10

10:                                               ; preds = %6
  %11 = bitcast %struct.posix_spawnattr_t* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(336) %8, i8* noundef nonnull align 8 dereferenceable(336) %11, i64 336, i1 false) #6, !tbaa.struct !3
  br label %12

12:                                               ; preds = %10, %6
  %13 = getelementptr inbounds %struct.posix_spawnattr_t, %struct.posix_spawnattr_t* %7, i64 0, i32 6
  store i8* bitcast (i32 (i8*, i8**, i8**)* @__execvpe to i8*), i8** %13, align 8, !tbaa !11
  %14 = call i32 @posix_spawn(i32* noundef %0, i8* noundef %1, %struct.posix_spawn_file_actions_t* noundef %2, %struct.posix_spawnattr_t* noundef nonnull %7, i8** noundef %4, i8** noundef %5) #7
  call void @llvm.lifetime.end.p0i8(i64 336, i8* nonnull %8) #5
  ret i32 %14
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: optsize
declare hidden i32 @__execvpe(i8* noundef, i8** noundef, i8** noundef) #4

; Function Attrs: optsize
declare i32 @posix_spawn(i32* noundef, i8* noundef, %struct.posix_spawn_file_actions_t* noundef, %struct.posix_spawnattr_t* noundef, i8** noundef, i8** noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }
attributes #7 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 0, i64 4, !4, i64 4, i64 4, !4, i64 8, i64 128, !8, i64 136, i64 128, !8, i64 264, i64 4, !4, i64 268, i64 4, !4, i64 272, i64 8, !9, i64 280, i64 56, !8}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !6, i64 0}
!11 = !{!12, !10, i64 272}
!12 = !{!"", !5, i64 0, !5, i64 4, !13, i64 8, !13, i64 136, !5, i64 264, !5, i64 268, !10, i64 272, !6, i64 280}
!13 = !{!"__sigset_t", !6, i64 0}
