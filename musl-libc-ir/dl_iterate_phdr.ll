; ModuleID = 'src/ldso/dl_iterate_phdr.c'
source_filename = "src/ldso/dl_iterate_phdr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.dl_phdr_info = type { i64, i8*, %struct.Elf64_Phdr*, i16, i64, i64, i64, i8* }
%struct.Elf64_Phdr = type { i32, i32, i64, i64, i64, i64, i64, i64 }

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@_DYNAMIC = extern_weak hidden constant [0 x i64], align 8
@.str = private unnamed_addr constant [15 x i8] c"/proc/self/exe\00", align 1

@dl_iterate_phdr = weak alias i32 (i32 (%struct.dl_phdr_info*, i64, i8*)*, i8*), i32 (i32 (%struct.dl_phdr_info*, i64, i8*)*, i8*)* @static_dl_iterate_phdr

; Function Attrs: nounwind optsize strictfp
define internal i32 @static_dl_iterate_phdr(i32 (%struct.dl_phdr_info*, i64, i8*)* nocapture noundef readonly %0, i8* noundef %1) #0 {
  %3 = alloca %struct.dl_phdr_info, align 8
  %4 = alloca [38 x i64], align 16
  %5 = alloca <2 x i64>, align 16
  %6 = bitcast %struct.dl_phdr_info* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %6) #4
  %7 = bitcast [38 x i64]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 304, i8* nonnull %7) #4
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(304) %7, i8 0, i64 304, i1 false) #5
  %8 = load i64*, i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5), align 8, !tbaa !3
  %9 = load i64, i64* %8, align 8, !tbaa !11
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %60, label %11

11:                                               ; preds = %2, %20
  %12 = phi i64 [ %23, %20 ], [ %9, %2 ]
  %13 = phi i64 [ %21, %20 ], [ 0, %2 ]
  %14 = icmp ult i64 %12, 38
  br i1 %14, label %15, label %20

15:                                               ; preds = %11
  %16 = or i64 %13, 1
  %17 = getelementptr inbounds i64, i64* %8, i64 %16
  %18 = load i64, i64* %17, align 8, !tbaa !11
  %19 = getelementptr inbounds [38 x i64], [38 x i64]* %4, i64 0, i64 %12
  store i64 %18, i64* %19, align 8, !tbaa !11
  br label %20

20:                                               ; preds = %11, %15
  %21 = add i64 %13, 2
  %22 = getelementptr inbounds i64, i64* %8, i64 %21
  %23 = load i64, i64* %22, align 8, !tbaa !11
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %11

25:                                               ; preds = %20
  %26 = getelementptr inbounds [38 x i64], [38 x i64]* %4, i64 0, i64 3
  %27 = load i64, i64* %26, align 8, !tbaa !11
  %28 = getelementptr inbounds [38 x i64], [38 x i64]* %4, i64 0, i64 5
  %29 = load i64, i64* %28, align 8, !tbaa !11
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %60, label %31

31:                                               ; preds = %25
  %32 = inttoptr i64 %27 to i8*
  %33 = getelementptr inbounds [38 x i64], [38 x i64]* %4, i64 0, i64 4
  %34 = load i64, i64* %33, align 16, !tbaa !11
  br label %35

35:                                               ; preds = %31, %53
  %36 = phi i64 [ %29, %31 ], [ %57, %53 ]
  %37 = phi i64 [ 0, %31 ], [ %54, %53 ]
  %38 = phi %struct.Elf64_Phdr* [ null, %31 ], [ %56, %53 ]
  %39 = phi i8* [ %32, %31 ], [ %58, %53 ]
  %40 = bitcast i8* %39 to %struct.Elf64_Phdr*
  %41 = bitcast i8* %39 to i32*
  %42 = load i32, i32* %41, align 8, !tbaa !12
  %43 = icmp eq i32 %42, 6
  br i1 %43, label %47, label %44

44:                                               ; preds = %35
  %45 = icmp ne i32 %42, 2
  %46 = or i1 %45, icmp eq (i64* getelementptr inbounds ([0 x i64], [0 x i64]* @_DYNAMIC, i64 0, i64 0), i64* null)
  br i1 %46, label %53, label %47

47:                                               ; preds = %44, %35
  %48 = phi i64 [ %27, %35 ], [ ptrtoint ([0 x i64]* @_DYNAMIC to i64), %44 ]
  %49 = getelementptr inbounds i8, i8* %39, i64 16
  %50 = bitcast i8* %49 to i64*
  %51 = load i64, i64* %50, align 8, !tbaa !14
  %52 = sub i64 %48, %51
  br label %53

53:                                               ; preds = %47, %44
  %54 = phi i64 [ %37, %44 ], [ %52, %47 ]
  %55 = icmp eq i32 %42, 7
  %56 = select i1 %55, %struct.Elf64_Phdr* %40, %struct.Elf64_Phdr* %38
  %57 = add i64 %36, -1
  %58 = getelementptr inbounds i8, i8* %39, i64 %34
  %59 = icmp eq i64 %57, 0
  br i1 %59, label %69, label %35

60:                                               ; preds = %25, %2
  %61 = phi i64 [ %27, %25 ], [ 0, %2 ]
  %62 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 0
  store i64 0, i64* %62, align 8, !tbaa !15
  %63 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 1
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i8** %63, align 8, !tbaa !19
  %64 = inttoptr i64 %61 to %struct.Elf64_Phdr*
  %65 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 2
  store %struct.Elf64_Phdr* %64, %struct.Elf64_Phdr** %65, align 8, !tbaa !20
  %66 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 3
  store i16 0, i16* %66, align 8, !tbaa !21
  %67 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 4
  %68 = bitcast i64* %67 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %68, align 8, !tbaa !22
  br label %83

69:                                               ; preds = %53
  %70 = icmp eq %struct.Elf64_Phdr* %56, null
  %71 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 0
  store i64 %54, i64* %71, align 8, !tbaa !15
  %72 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 1
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i8** %72, align 8, !tbaa !19
  %73 = inttoptr i64 %27 to %struct.Elf64_Phdr*
  %74 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 2
  store %struct.Elf64_Phdr* %73, %struct.Elf64_Phdr** %74, align 8, !tbaa !20
  %75 = trunc i64 %29 to i16
  %76 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 3
  store i16 %75, i16* %76, align 8, !tbaa !21
  %77 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 4
  %78 = bitcast i64* %77 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %78, align 8, !tbaa !22
  br i1 %70, label %83, label %79

79:                                               ; preds = %69
  %80 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 6
  store i64 1, i64* %80, align 8, !tbaa !23
  %81 = getelementptr inbounds <2 x i64>, <2 x i64>* %5, i64 0, i64 0
  store <2 x i64> <i64 1, i64 0>, <2 x i64>* %5, align 16, !tbaa !11
  %82 = call i8* @__tls_get_addr(i64* noundef nonnull %81) #6
  br label %85

83:                                               ; preds = %60, %69
  %84 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 6
  store i64 0, i64* %84, align 8, !tbaa !23
  br label %85

85:                                               ; preds = %83, %79
  %86 = phi i8* [ null, %83 ], [ %82, %79 ]
  %87 = getelementptr inbounds %struct.dl_phdr_info, %struct.dl_phdr_info* %3, i64 0, i32 7
  store i8* %86, i8** %87, align 8
  %88 = call i32 %0(%struct.dl_phdr_info* noundef nonnull %3, i64 noundef 64, i8* noundef %1) #6
  call void @llvm.lifetime.end.p0i8(i64 304, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %6) #4
  ret i32 %88
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: optsize
declare i8* @__tls_get_addr(i64* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 8}
!4 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !7, i64 4, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !10, i64 56}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{!"__locale_struct", !5, i64 0}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !7, i64 0}
!13 = !{!"", !7, i64 0, !7, i64 4, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48}
!14 = !{!13, !9, i64 16}
!15 = !{!16, !9, i64 0}
!16 = !{!"dl_phdr_info", !9, i64 0, !8, i64 8, !8, i64 16, !17, i64 24, !18, i64 32, !18, i64 40, !9, i64 48, !8, i64 56}
!17 = !{!"short", !5, i64 0}
!18 = !{!"long long", !5, i64 0}
!19 = !{!16, !8, i64 8}
!20 = !{!16, !8, i64 16}
!21 = !{!16, !17, i64 24}
!22 = !{!18, !18, i64 0}
!23 = !{!16, !9, i64 48}
